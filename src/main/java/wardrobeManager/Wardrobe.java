package wardrobeManager;

import User.User;
import lombok.*;
import wardrobeManager.item.Item;
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
@Table(name = "wardrobes")
public class Wardrobe extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    private String description;

    private String location;

    private String imageUrl;

    private boolean isFavourite;

    private boolean isVisible;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;

    // Cascade ALL para borrar todos los items pero no sé si quiero eso
    @OneToMany(mappedBy="wardrobe", cascade=CascadeType.ALL, orphanRemoval=true)
    private Set<Item> items = new HashSet<>();
}
