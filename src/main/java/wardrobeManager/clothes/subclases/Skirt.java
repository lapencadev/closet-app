package wardrobeManager.clothes.subclases;

import lombok.*;
import wardrobeManager.clothes.Clothes;

import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "skirts")
public class Skirt extends Clothes {
    private String sleeveLength;
    private String fitType;
}
