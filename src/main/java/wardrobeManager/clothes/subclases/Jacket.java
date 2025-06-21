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
@Table(name = "jackets")
public class Jacket extends Clothes {
    private String type;
    private Length length;
}
