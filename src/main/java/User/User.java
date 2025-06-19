package User;

import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.loan.Loan;
import wardrobeManager.util.AuditableEntity;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "USER")
public class User extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    private String password; // Password should be stored securely (hashed)
    private String profilePictureUrl;
    private boolean isActive;

    @OneToMany(mappedBy="user")
    private Set<Wardrobe> wardrobes;

    @OneToMany(mappedBy="owner")
    private Set<Loan> loansGiven;

}
