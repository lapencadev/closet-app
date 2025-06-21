package wardrobeManager.accesories;

import lombok.*;
import wardrobeManager.item.Item;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "accessories")
public abstract class Accessories extends Item {
    private String material;
}
