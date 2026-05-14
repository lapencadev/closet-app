package wardrobeManager.clothes.subclases;

import org.junit.jupiter.api.Test;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Length;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;
import user.User;

import static org.assertj.core.api.Assertions.assertThat;

class JumperTest {

    @Test
    void jumper_conSleeveLength_mappeaCorrectamente() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Jumper jumper = new Jumper();
        jumper.setId(1L);
        jumper.setName("Wool Sweater");
        jumper.setType("pullover");
        jumper.setSleeveLength(Length.LONG);
        jumper.setColour(Colours.GREY);
        jumper.setSeason(Season.WINTER);
        jumper.setSize(Size.M);
        jumper.setFabricType("wool");
        jumper.setWardrobe(wardrobe);

        // Then
        assertThat(jumper).isNotNull();
        assertThat(jumper.getId()).isEqualTo(1L);
        assertThat(jumper.getName()).isEqualTo("Wool Sweater");
        assertThat(jumper.getType()).isEqualTo("pullover");
        assertThat(jumper.getSleeveLength()).isEqualTo(Length.LONG);
        assertThat(jumper.getColour()).isEqualTo(Colours.GREY);
        assertThat(jumper.getFabricType()).isEqualTo("wool");
    }

    @Test
    void jumper_conDiferentesSleeveLength() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When - test all sleeve lengths
        Length[] sleeveLengths = {Length.SHORT, Length.MEDIUM, Length.LONG};
        for (Length length : sleeveLengths) {
            Jumper jumper = new Jumper();
            jumper.setSleeveLength(length);
            jumper.setWardrobe(wardrobe);

            // Then
            assertThat(jumper.getSleeveLength()).isEqualTo(length);
        }
    }

    @Test
    void jumper_todosLosCampos() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Jumper cardigan = new Jumper();
        cardigan.setId(2L);
        cardigan.setName("Cardigan");
        cardigan.setType("cardigan");
        cardigan.setSleeveLength(Length.MEDIUM);
        cardigan.setColour(Colours.BLACK);
        cardigan.setSecondaryColour(Colours.WHITE);
        cardigan.setSize(Size.L);
        cardigan.setFabricType("cotton");
        cardigan.setPattern("striped");
        cardigan.setWardrobe(wardrobe);

        // Then
        assertThat(cardigan.getName()).isEqualTo("Cardigan");
        assertThat(cardigan.getType()).isEqualTo("cardigan");
        assertThat(cardigan.getSleeveLength()).isEqualTo(Length.MEDIUM);
        assertThat(cardigan.getSecondaryColour()).isEqualTo(Colours.WHITE);
    }
}


