package wardrobeManager.clothes.subclases;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import wardrobeManager.clothes.Clothes;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "footwear")
public class Footwear extends Clothes {
    private String type;
}
