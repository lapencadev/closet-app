package user;

import com.google.firebase.auth.FirebaseToken;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public User findOrCreate(FirebaseToken token) {
        return userRepository.findByFirebaseUid(token.getUid())
                .orElseGet(() -> createFromToken(token));
    }

    private User createFromToken(FirebaseToken token) {
        String displayName = token.getName() != null ? token.getName() : token.getEmail();
        User newUser = User.builder()
                .firebaseUid(token.getUid())
                .email(token.getEmail())
                .name(displayName)
                .profilePictureUrl(token.getPicture())
                .isActive(true)
                .build();
        return userRepository.save(newUser);
    }
}