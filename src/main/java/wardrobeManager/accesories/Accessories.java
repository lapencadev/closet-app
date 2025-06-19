package wardrobeManager.accesories;

import lombok.*;
import wardrobeManager.item.Item;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "ACCESSORIES")
public abstract class Accessories extends Item {

    private String material;
}
