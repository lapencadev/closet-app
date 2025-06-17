package wardrobeManager.clothes;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "SHIRTS")
public class Shirt extends Clothes {
    private String sleeveLength; // e.g., short, long, sleeveless

    private String collarType; // e.g., button-down, spread, mandarin
    private String fitType; // e.g., slim, regular, relaxed
}
