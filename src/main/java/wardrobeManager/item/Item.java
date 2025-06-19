package wardrobeManager.item;

import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.AuditableEntity;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ITEMS")
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
    private String brand; // e.g., Nike, Adidas, Zara
    private boolean isFavourite;
    private boolean isBorrowed;
    public boolean isVisible;

    @ManyToOne
    @JoinColumn(name="wardrobe_id")
    private Wardrobe wardrobe;
}
