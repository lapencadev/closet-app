package user;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.loan.Loan;
import wardrobeManager.util.AuditableEntity;

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

    @Column(unique = true)
    private String firebaseUid;

    private String profilePictureUrl;

    private boolean isActive;

    @OneToMany(mappedBy="user", cascade=CascadeType.ALL, orphanRemoval=true)
    @Builder.Default
    private Set<Wardrobe> wardrobes = new HashSet<>();

    @OneToMany(mappedBy="owner", cascade=CascadeType.ALL, orphanRemoval=true)
    @Builder.Default
    private Set<Loan> loansGiven = new HashSet<>();

}
