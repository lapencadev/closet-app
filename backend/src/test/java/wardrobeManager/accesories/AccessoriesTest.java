package wardrobeManager.accesories;

import org.junit.jupiter.api.Test;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.AccessoryType;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;
import user.User;

import static org.assertj.core.api.Assertions.assertThat;

class AccessoriesTest {

    @Test
    void accessories_esConcreto_puedeInstanciarse() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When - instantiation should work without error
        Accessories bag = new Accessories();
        bag.setId(1L);
        bag.setName("Brown Leather Bag");
        bag.setType(AccessoryType.BAG);
        bag.setMaterial("leather");
        bag.setColour(Colours.BROWN);
        bag.setSize(Size.ONE_SIZE);
        bag.setWardrobe(wardrobe);

        // Then
        assertThat(bag).isNotNull();
        assertThat(bag.getClass().getName()).endsWith("Accessories");
        assertThat(bag.getId()).isEqualTo(1L);
        assertThat(bag.getName()).isEqualTo("Brown Leather Bag");
        assertThat(bag.getType()).isEqualTo(AccessoryType.BAG);
        assertThat(bag.getMaterial()).isEqualTo("leather");
    }

    @Test
    void accessories_builder_trabajaCorrectamente() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When
        Accessories hat = new Accessories();
        hat.setId(2L);
        hat.setName("Red Hat");
        hat.setType(AccessoryType.HAT);
        hat.setMaterial("wool");
        hat.setColour(Colours.RED);
        hat.setSeason(Season.WINTER);
        hat.setSize(Size.ONE_SIZE);
        hat.setFavourite(true);
        hat.setWardrobe(wardrobe);

        // Then
        assertThat(hat.getId()).isEqualTo(2L);
        assertThat(hat.getName()).isEqualTo("Red Hat");
        assertThat(hat.getType()).isEqualTo(AccessoryType.HAT);
        assertThat(hat.getMaterial()).isEqualTo("wool");
        assertThat(hat.isFavourite()).isTrue();
    }

    @Test
    void accessories_tiposValidos() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(user).build();

        // When - verify different accessory types can be set
        AccessoryType[] types = {
                AccessoryType.BAG,
                AccessoryType.BELT,
                AccessoryType.HAT,
                AccessoryType.SCARF,
                AccessoryType.JEWELLERY,
                AccessoryType.SUNGLASSES,
                AccessoryType.WATCH
        };
        for (AccessoryType type : types) {
            Accessories accessory = new Accessories();
            accessory.setType(type);
            accessory.setWardrobe(wardrobe);

            // Then
            assertThat(accessory.getType()).isEqualTo(type);
        }
    }
}



