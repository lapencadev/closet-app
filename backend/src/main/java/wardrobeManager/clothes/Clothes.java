package wardrobeManager.clothes;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import wardrobeManager.item.Item;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "clothes")
public abstract class Clothes extends Item {
    private String fabricType;
    private String pattern;
}
