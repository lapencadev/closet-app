package wardrobeManager.clothes;

import lombok.*;
import wardrobeManager.item.Item;
import javax.persistence.*;

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
