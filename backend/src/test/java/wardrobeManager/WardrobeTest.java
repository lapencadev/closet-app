package wardrobeManager;

import org.junit.jupiter.api.Test;
import user.User;

import static org.assertj.core.api.Assertions.assertThat;

class WardrobeTest {

    @Test
    void wardrobe_isAutoFavourites_parcelasEspecialesDeFavoritos() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();

        Wardrobe favoritesWardrobe = Wardrobe.builder()
                .id(1L)
                .name("❤️ Mis favoritos")
                .isAutoFavourites(true)
                .isFavourite(true)
                .user(user)
                .build();

        // Then
        assertThat(favoritesWardrobe).isNotNull();
        assertThat(favoritesWardrobe.isAutoFavourites()).isTrue();
        assertThat(favoritesWardrobe.isFavourite()).isTrue();
        assertThat(favoritesWardrobe.getName()).contains("favorito");
    }

    @Test
    void wardrobe_armarioNormal_isAutoFavouritesEsFalse() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();

        // When
        Wardrobe normalWardrobe = Wardrobe.builder()
                .id(2L)
                .name("Verano 2026")
                .isAutoFavourites(false)
                .isFavourite(false)
                .user(user)
                .build();

        // Then
        assertThat(normalWardrobe.isAutoFavourites()).isFalse();
        assertThat(normalWardrobe.isFavourite()).isFalse();
    }

    @Test
    void wardrobe_todosLosCampos() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();

        // When
        Wardrobe wardrobe = new Wardrobe();
        wardrobe.setId(3L);
        wardrobe.setName("Invierno");
        wardrobe.setDescription("Prendas de invierno");
        wardrobe.setLocation("Armario principal");
        wardrobe.setImageUrl("/images/winter.jpg");
        wardrobe.setFavourite(true);
        wardrobe.setVisible(true);
        wardrobe.setAutoFavourites(false);
        wardrobe.setUser(user);

        // Then
        assertThat(wardrobe.getId()).isEqualTo(3L);
        assertThat(wardrobe.getName()).isEqualTo("Invierno");
        assertThat(wardrobe.getDescription()).isEqualTo("Prendas de invierno");
        assertThat(wardrobe.getLocation()).isEqualTo("Armario principal");
        assertThat(wardrobe.getImageUrl()).isEqualTo("/images/winter.jpg");
        assertThat(wardrobe.isFavourite()).isTrue();
        assertThat(wardrobe.isVisible()).isTrue();
        assertThat(wardrobe.isAutoFavourites()).isFalse();
    }

    @Test
    void wardrobe_defaultValues() {
        // Given
        User user = User.builder().id(1L).email("test@closet.com").name("Test").build();

        // When
        Wardrobe wardrobe = new Wardrobe();
        wardrobe.setName("Test Wardrobe");
        wardrobe.setUser(user);

        // Then
        assertThat(wardrobe.isFavourite()).isFalse();
        assertThat(wardrobe.isVisible()).isFalse(); // default from no-arg constructor
        assertThat(wardrobe.isAutoFavourites()).isFalse();
    }
}

