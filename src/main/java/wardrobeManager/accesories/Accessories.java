package wardrobeManager.accesories;

import lombok.*;
import wardrobeManager.item.Item;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "accesories")
public abstract class Accessories extends Item {
    private String material;
}
