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
@Table(name = "swimsuits")
public class Swimsuit extends Clothes {
    private String type;
}
