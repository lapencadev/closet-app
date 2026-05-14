package wardrobeManager.item;

import org.junit.jupiter.api.Test;
import wardrobeManager.clothes.subclases.Shirt;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Length;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;
import user.User;

import static org.assertj.core.api.Assertions.assertThat;

class ItemTest {

    @Test
    void item_conSecondaryColour_mappeaCorrectamente() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Striped Shirt");
        shirt.setColour(Colours.BLUE);
        shirt.setSecondaryColour(Colours.WHITE);
        shirt.setSeason(Season.SPRING);
        shirt.setSize(Size.M);
        shirt.setWardrobe(wardrobe);

        // Then
        assertThat(shirt).isNotNull();
        assertThat(shirt.getColour()).isEqualTo(Colours.BLUE);
        assertThat(shirt.getSecondaryColour()).isEqualTo(Colours.WHITE);
    }

    @Test
    void item_conSecondaryColourMulticolour() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Shirt shirt = new Shirt();
        shirt.setId(2L);
        shirt.setName("Multicolor Blouse");
        shirt.setColour(Colours.MULTICOLOUR);
        shirt.setSecondaryColour(null); // MULTICOLOUR puede estar sola
        shirt.setWardrobe(wardrobe);

        // Then
        assertThat(shirt.getColour()).isEqualTo(Colours.MULTICOLOUR);
        assertThat(shirt.getSecondaryColour()).isNull();
    }

    @Test
    void item_sinSecondaryColour() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Shirt shirt = new Shirt();
        shirt.setName("Black Shirt");
        shirt.setColour(Colours.BLACK);
        shirt.setSecondaryColour(null);
        shirt.setWardrobe(wardrobe);

        // Then
        assertThat(shirt.getColour()).isEqualTo(Colours.BLACK);
        assertThat(shirt.getSecondaryColour()).isNull();
    }

    @Test
    void item_nuevoColoresEnum() {
        // When - verify all new enum colors exist
        Colours[] newColors = {
                Colours.BLACK,
                Colours.WHITE,
                Colours.GREY,
                Colours.BEIGE,
                Colours.BROWN,
                Colours.RED,
                Colours.PINK,
                Colours.ORANGE,
                Colours.YELLOW,
                Colours.GREEN,
                Colours.TEAL,
                Colours.BLUE,
                Colours.NAVY_BLUE,
                Colours.PURPLE,
                Colours.LAVENDER,
                Colours.GOLD,
                Colours.SILVER,
                Colours.MULTICOLOUR
        };

        // Then
        for (Colours color : newColors) {
            assertThat(color).isNotNull();
        }
        assertThat(newColors).hasSize(18);
    }
}

