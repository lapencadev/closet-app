package wardrobeManager.clothes;

import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "CLOTHES")
public abstract class Clothes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull private String name;

    @Enumerated(EnumType.STRING)
    private Season season;
    @Enumerated(EnumType.STRING)
    private Size size;
    private Long wardrobeId;
    @Enumerated(EnumType.STRING)
    private Colours colour;
    private String description;
    private String imageUrl;
    private String fabricType; // e.g., cotton, linen, polyester
    private String brand; // e.g., Nike, Adidas, Zara
    private boolean isFavourite; // Indicates if the item is marked as a favourite by the user
    private boolean isBorrowed; // Indicates if the item is currently borrowed by someone else
    public boolean isVisible; // Indicates if the item is visible in the wardrobe
    private String pattern; // e.g., solid, striped, checked
    private String style; // e.g., casual, formal, sporty

    @ManyToOne
    @JoinColumn(name = "wardrobe_id", insertable = false, updatable = false)
    private Wardrobe wardrobe; // Reference to the wardrobe this item belongs to
}
