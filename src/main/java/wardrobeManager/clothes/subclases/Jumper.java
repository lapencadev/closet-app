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
@Table(name = "jumpers")
public class Jumper extends Clothes {
    private String type;
}
