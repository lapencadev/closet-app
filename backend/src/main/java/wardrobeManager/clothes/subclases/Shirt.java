package wardrobeManager.clothes.subclases;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import wardrobeManager.clothes.Clothes;
import wardrobeManager.util.Length;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "shirts")
public class Shirt extends Clothes {
    private Length sleeveLength;
    private String fitType;
}
