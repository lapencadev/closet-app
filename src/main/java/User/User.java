package User;

import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.loan.Loan;
import wardrobeManager.util.AuditableEntity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "users")
public class User extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    @NotNull
    @Column(unique = true)
    private String email;

    @NotNull
    private String password; // Password should be stored securely (hashed)

    private String profilePictureUrl;

    private boolean isActive;

    @OneToMany(mappedBy="user", cascade=CascadeType.ALL, orphanRemoval=true)
    private Set<Wardrobe> wardrobes = new HashSet<>();

    @OneToMany(mappedBy="owner", cascade=CascadeType.ALL, orphanRemoval=true)
    private Set<Loan> loansGiven = new HashSet<>();

}
