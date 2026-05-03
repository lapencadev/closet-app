package admin.security;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class FirebaseTokenFilterTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private FirebaseAuth firebaseAuth;

    @BeforeEach
    void resetMocks() {
        Mockito.reset(firebaseAuth);
    }

    @Test
    void sinToken_devuelve403() throws Exception {
        mockMvc.perform(get("/api/users/me"))
                .andExpect(status().isForbidden());
    }

    @Test
    void tokenInvalido_devuelve403() throws Exception {
        when(firebaseAuth.verifyIdToken(anyString()))
                .thenThrow(Mockito.mock(FirebaseAuthException.class));

        mockMvc.perform(get("/api/users/me")
                        .header("Authorization", "Bearer token-malo"))
                .andExpect(status().isForbidden());
    }

    @Test
    void tokenValido_creaUsuarioYDevuelve200() throws Exception {
        FirebaseToken token = Mockito.mock(FirebaseToken.class);
        when(token.getUid()).thenReturn("uid-filter-test");
        when(token.getEmail()).thenReturn("filter@closet.com");
        when(token.getName()).thenReturn("Filter Test");
        when(firebaseAuth.verifyIdToken("token-bueno")).thenReturn(token);

        mockMvc.perform(get("/api/users/me")
                        .header("Authorization", "Bearer token-bueno"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.email").value("filter@closet.com"));
    }
}