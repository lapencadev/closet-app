package wardrobeManager.clothes.subclases;

import lombok.*;
import wardrobeManager.clothes.Clothes;
import wardrobeManager.util.Length;

import javax.persistence.Entity;
import javax.persistence.Table;

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
