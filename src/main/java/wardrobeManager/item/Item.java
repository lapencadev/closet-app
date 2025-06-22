package wardrobeManager.item;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.AuditableEntity;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "items")
abstract public class Item extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    private String description;

    @Enumerated(EnumType.STRING)
    private Colours colour;

    @Enumerated(EnumType.STRING)
    private Season season;

    @Enumerated(EnumType.STRING)
    private Size size;

    private String imageUrl;

    private String brand;

    private boolean isFavourite;

    private boolean isBorrowed;

    public boolean isVisible;

    // No sé si quiero que no sea null, según qué hacer con las prendas cuando se elmina un armario
    @ManyToOne
    @JoinColumn(name="wardrobe_id", nullable = false)
    private Wardrobe wardrobe;
}
