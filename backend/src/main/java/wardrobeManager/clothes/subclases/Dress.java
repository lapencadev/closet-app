package wardrobeManager.clothes.subclases;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
@Table(name = "dresses")
public class Dress extends Clothes {
    @Enumerated(EnumType.STRING)
    private Length length;
    private String style;
}
