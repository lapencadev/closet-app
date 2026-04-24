package wardrobeManager.accesories;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import wardrobeManager.item.Item;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "accessories")
public abstract class Accessories extends Item {
    private String material;
}
