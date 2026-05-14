package wardrobeManager.dto;

import org.springframework.stereotype.Component;
import wardrobeManager.item.Item;

@Component
public class ItemMapper {

    public ItemDTO itemToItemDTO(Item item) {
        if (item == null) {
            return null;
        }

        return ItemDTO.builder()
                .id(item.getId())
                .name(item.getName())
                .type(getItemType(item))
                .colour(enumToString(item.getColour()))
                .secondaryColour(enumToString(item.getSecondaryColour()))
                .season(enumToString(item.getSeason()))
                .size(enumToString(item.getSize()))
                .imagePath(item.getImageUrl())
                .isFavorite(item.isFavourite())
                .isBorrowed(item.isBorrowed())
                .isVisible(item.isVisible)
                .wardrobeId(item.getWardrobe() != null ? item.getWardrobe().getId() : null)
                .brand(item.getBrand())
                .description(item.getDescription())
                .build();
    }

    // Helper methods to extract type and convert enums
    private String getItemType(Item item) {
        if (item == null) {
            return null;
        }
        // Extract the class name and convert to lowercase
        return item.getClass().getSimpleName().toLowerCase();
    }

    private String enumToString(Enum<?> value) {
        if (value == null) {
            return null;
        }
        return value.toString();
    }
}


