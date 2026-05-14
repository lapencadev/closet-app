package wardrobeManager.dto;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import wardrobeManager.clothes.subclases.Shirt;
import wardrobeManager.loan.Loan;
import wardrobeManager.util.Colours;
import wardrobeManager.Wardrobe;
import user.User;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;

class LoanMapperTest {

    private LoanMapper loanMapper;

    @BeforeEach
    void setUp() {
        loanMapper = new LoanMapper();
    }

    @Test
    void loanToLoanDTO_mappeaCorrectamenteTodosLosCampos() {
        // Given
        LocalDate dateLoaned = LocalDate.of(2026, 5, 1);
        LocalDate expectedReturnDate = LocalDate.of(2026, 5, 15);
        LocalDate dateReturned = LocalDate.of(2026, 5, 14);

        User owner = User.builder().id(1L).email("owner@closet.com").name("Owner").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Borrowed Shirt");
        shirt.setColour(Colours.BLUE);
        shirt.setWardrobe(wardrobe);

        Loan loan = Loan.builder()
                .id(1L)
                .loanedItem(shirt)
                .borrowerName("María")
                .dateLoaned(dateLoaned)
                .dateReturned(dateReturned)
                .expectedReturnDate(expectedReturnDate)
                .isReturned(true)
                .notes("Returned in perfect condition")
                .owner(owner)
                .build();

        // When
        LoanDTO dto = loanMapper.loanToLoanDTO(loan);

        // Then
        assertThat(dto).isNotNull();
        assertThat(dto.getId()).isEqualTo(1L);
        assertThat(dto.getItemId()).isEqualTo(1L);
        assertThat(dto.getBorrowerName()).isEqualTo("María");
        assertThat(dto.getDateLoaned()).isEqualTo(dateLoaned);
        assertThat(dto.getDateReturned()).isEqualTo(dateReturned);
        assertThat(dto.getExpectedReturnDate()).isEqualTo(expectedReturnDate);
        assertThat(dto.getIsReturned()).isTrue();
        assertThat(dto.getNotes()).isEqualTo("Returned in perfect condition");
    }

    @Test
    void loanToLoanDTO_conExpectedReturnDateNula_mappeaCorrectamente() {
        // Given
        LocalDate dateLoaned = LocalDate.of(2026, 5, 1);

        User owner = User.builder().id(1L).email("owner@closet.com").name("Owner").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Shirt");
        shirt.setWardrobe(wardrobe);

        Loan loan = Loan.builder()
                .id(2L)
                .loanedItem(shirt)
                .borrowerName("Carlos")
                .dateLoaned(dateLoaned)
                .dateReturned(null)
                .expectedReturnDate(null)
                .isReturned(false)
                .notes(null)
                .owner(owner)
                .build();

        // When
        LoanDTO dto = loanMapper.loanToLoanDTO(loan);

        // Then
        assertThat(dto.getExpectedReturnDate()).isNull();
        assertThat(dto.getNotes()).isNull();
        assertThat(dto.getIsReturned()).isFalse();
    }

    @Test
    void loanToLoanDTO_loanNulo_devuelveNull() {
        // When
        LoanDTO dto = loanMapper.loanToLoanDTO(null);

        // Then
        assertThat(dto).isNull();
    }
}


