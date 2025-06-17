package wardrobeManager;

import lombok.*;
import wardrobeManager.clothes.Clothes;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "WARDROBES")
public class Wardrobe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private Long userId;
    private String location; // e.g., bedroom, living room, etc.
    private String imageUrl; // URL to an image representing the wardrobe
    private boolean isPublic; // Indicates if the wardrobe is public or private
    private boolean isFavourite; // Indicates if the wardrobe is marked as a favourite by the user
    @OneToMany(cascade = CascadeType.ALL)
    Set<Clothes> clothes; // List of clothes items in the wardrobe
}
