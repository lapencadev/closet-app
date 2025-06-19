package wardrobeManager.clothes;

import lombok.*;
import wardrobeManager.Wardrobe;
import wardrobeManager.item.Item;
import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "CLOTHES")
public abstract class Clothes extends Item {
    private String fabricType; // e.g., cotton, linen, polyester

    private String pattern; // e.g., solid, striped, checked

    @ManyToOne
    @JoinColumn(name = "wardrobe_id", insertable = false, updatable = false)
    private Wardrobe wardrobe; // Reference to the wardrobe this item belongs to
}
