package wardrobeManager;

import User.User;
import lombok.*;
import wardrobeManager.clothes.Clothes;
import wardrobeManager.item.Item;
import wardrobeManager.util.AuditableEntity;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "WARDROBES")
public class Wardrobe extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;

    private String location; // e.g., bedroom, living room, etc.
    private String imageUrl; // URL to an image representing the wardrobe
    private boolean isPublic; // Indicates if the wardrobe is public or private
    private boolean isFavourite; // Indicates if the wardrobe is marked as a favourite by the user
    private boolean isVisible; // Indicates if the wardrobe is visible in the user's collection
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @OneToMany(mappedBy="wardrobe", cascade=CascadeType.ALL)
    private Set<Item> items;
}
