package wardrobeManager.accesories;

import jakarta.persistence.*;
import lombok.*;
import wardrobeManager.item.Item;
import wardrobeManager.util.AccessoryType;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "accessories")
public class Accessories extends Item {
    @Enumerated(EnumType.STRING)
    private AccessoryType type;
    private String material;
}
