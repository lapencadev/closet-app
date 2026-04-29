package wardrobeManager.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemDTO {
    private Long id;
    private String name;
    private String type; // Type of clothing (shirt, pants, dress, etc.)
    private String colour;
    private String season;
    private String size;
    private String imagePath;
    private Boolean isFavorite;
    private Long wardrobeId;
}

