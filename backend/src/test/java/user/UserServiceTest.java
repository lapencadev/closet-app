package user;

import com.google.firebase.auth.FirebaseToken;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserService userService;

    @Test
    void findOrCreate_usuarioExistente_retornaExistenteSinGuardar() {
        FirebaseToken token = Mockito.mock(FirebaseToken.class);
        when(token.getUid()).thenReturn("uid-existente");

        User existing = User.builder()
                .id(1L).firebaseUid("uid-existente").email("a@closet.com").name("Ana").isActive(true)
                .build();
        when(userRepository.findByFirebaseUid("uid-existente")).thenReturn(Optional.of(existing));

        User result = userService.findOrCreate(token);

        assertThat(result).isSameAs(existing);
        verify(userRepository, never()).save(any());
    }

    @Test
    void findOrCreate_usuarioNuevo_guardaConDatosFirebase() {
        FirebaseToken token = Mockito.mock(FirebaseToken.class);
        when(token.getUid()).thenReturn("uid-nuevo");
        when(token.getEmail()).thenReturn("nuevo@closet.com");
        when(token.getName()).thenReturn("Nuevo User");
        when(token.getPicture()).thenReturn(null);

        when(userRepository.findByFirebaseUid("uid-nuevo")).thenReturn(Optional.empty());
        when(userRepository.save(any())).thenAnswer(inv -> inv.getArgument(0));

        User result = userService.findOrCreate(token);

        assertThat(result.getEmail()).isEqualTo("nuevo@closet.com");
        assertThat(result.getFirebaseUid()).isEqualTo("uid-nuevo");
        assertThat(result.getName()).isEqualTo("Nuevo User");
        verify(userRepository).save(any(User.class));
    }

    @Test
    void findOrCreate_sinNombreEnFirebase_usaEmailComoNombre() {
        FirebaseToken token = Mockito.mock(FirebaseToken.class);
        when(token.getUid()).thenReturn("uid-sinombre");
        when(token.getEmail()).thenReturn("sinombre@closet.com");
        when(token.getName()).thenReturn(null);
        when(token.getPicture()).thenReturn(null);

        when(userRepository.findByFirebaseUid("uid-sinombre")).thenReturn(Optional.empty());
        when(userRepository.save(any())).thenAnswer(inv -> inv.getArgument(0));

        User result = userService.findOrCreate(token);

        assertThat(result.getName()).isEqualTo("sinombre@closet.com");
    }
}