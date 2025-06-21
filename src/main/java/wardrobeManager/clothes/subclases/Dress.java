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
@Table(name = "dresses")
public class Dress extends Clothes {
    private Length length;
    private String style;
}
