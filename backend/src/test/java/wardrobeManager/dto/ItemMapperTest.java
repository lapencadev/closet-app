package wardrobeManager.dto;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import wardrobeManager.clothes.subclases.Shirt;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Length;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;
import wardrobeManager.Wardrobe;
import user.User;

import static org.assertj.core.api.Assertions.assertThat;

class ItemMapperTest {

    private ItemMapper itemMapper;

    @BeforeEach
    void setUp() {
        itemMapper = new ItemMapper();
    }

    @Test
    void itemToItemDTO_mappeaCorrectamenteTodosLosCampos() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Blue Shirt");
        shirt.setColour(Colours.BLUE);
        shirt.setSecondaryColour(Colours.WHITE);
        shirt.setSeason(Season.SPRING);
        shirt.setSize(Size.M);
        shirt.setImageUrl("/path/to/image.jpg");
        shirt.setBrand("Zara");
        shirt.setDescription("A nice blue shirt");
        shirt.setFavourite(true);
        shirt.setBorrowed(false);
        shirt.setVisible(true);
        shirt.setWardrobe(wardrobe);
        shirt.setSleeveLength(Length.MEDIUM);
        shirt.setFitType("regular");
        shirt.setFabricType("cotton");
        shirt.setPattern("solid");

        // When
        ItemDTO dto = itemMapper.itemToItemDTO(shirt);

        // Then
        assertThat(dto).isNotNull();
        assertThat(dto.getId()).isEqualTo(1L);
        assertThat(dto.getName()).isEqualTo("Blue Shirt");
        assertThat(dto.getColour()).isEqualTo("BLUE");
        assertThat(dto.getSecondaryColour()).isEqualTo("WHITE");
        assertThat(dto.getSeason()).isEqualTo("SPRING");
        assertThat(dto.getSize()).isEqualTo("M");
        assertThat(dto.getImagePath()).isEqualTo("/path/to/image.jpg");
        assertThat(dto.getBrand()).isEqualTo("Zara");
        assertThat(dto.getDescription()).isEqualTo("A nice blue shirt");
        assertThat(dto.getIsFavorite()).isTrue();
        assertThat(dto.getIsBorrowed()).isFalse();
        assertThat(dto.getIsVisible()).isTrue();
        assertThat(dto.getWardrobeId()).isEqualTo(1L);
        assertThat(dto.getType()).isEqualTo("shirt");
    }

    @Test
    void itemToItemDTO_conSecondaryColourNula_mappeaCorrectamente() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        Shirt shirt = new Shirt();
        shirt.setId(2L);
        shirt.setName("Black Shirt");
        shirt.setColour(Colours.BLACK);
        shirt.setSecondaryColour(null);
        shirt.setSeason(Season.ALL_SEASONS);
        shirt.setSize(Size.L);
        shirt.setImageUrl("/path/to/black.jpg");
        shirt.setFavourite(false);
        shirt.setBorrowed(false);
        shirt.setVisible(true);
        shirt.setWardrobe(wardrobe);

        // When
        ItemDTO dto = itemMapper.itemToItemDTO(shirt);

        // Then
        assertThat(dto.getSecondaryColour()).isNull();
        assertThat(dto.getColour()).isEqualTo("BLACK");
    }

    @Test
    void itemToItemDTO_itemNulo_devuelveNull() {
        // When
        ItemDTO dto = itemMapper.itemToItemDTO(null);

        // Then
        assertThat(dto).isNull();
    }
}

