package wardrobeManager.loan;

import org.junit.jupiter.api.Test;
import wardrobeManager.clothes.subclases.Shirt;
import wardrobeManager.Wardrobe;
import wardrobeManager.util.Colours;
import wardrobeManager.util.Season;
import wardrobeManager.util.Size;
import user.User;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;

class LoanTest {

    @Test
    void loan_conExpectedReturnDateYNotes_mappeaCorrectamente() {
        // Given
        LocalDate dateLoaned = LocalDate.of(2026, 5, 1);
        LocalDate expectedReturnDate = LocalDate.of(2026, 5, 15);
        String notes = "Handle with care - delicate fabric";

        User owner = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Silk Blouse");
        shirt.setWardrobe(wardrobe);

        // When
        Loan loan = Loan.builder()
                .id(1L)
                .loanedItem(shirt)
                .borrowerName("Laura")
                .dateLoaned(dateLoaned)
                .expectedReturnDate(expectedReturnDate)
                .isReturned(false)
                .notes(notes)
                .owner(owner)
                .build();

        // Then
        assertThat(loan).isNotNull();
        assertThat(loan.getId()).isEqualTo(1L);
        assertThat(loan.getBorrowerName()).isEqualTo("Laura");
        assertThat(loan.getDateLoaned()).isEqualTo(dateLoaned);
        assertThat(loan.getExpectedReturnDate()).isEqualTo(expectedReturnDate);
        assertThat(loan.getNotes()).isEqualTo(notes);
        assertThat(loan.getIsReturned()).isFalse();
    }

    @Test
    void loan_conDateReturnedYExpectedReturnDate() {
        // Given
        LocalDate dateLoaned = LocalDate.of(2026, 5, 1);
        LocalDate expectedReturnDate = LocalDate.of(2026, 5, 15);
        LocalDate dateReturned = LocalDate.of(2026, 5, 14);

        User owner = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setName("Shirt");
        shirt.setWardrobe(wardrobe);

        // When
        Loan loan = new Loan();
        loan.setId(2L);
        loan.setLoanedItem(shirt);
        loan.setBorrowerName("Pedro");
        loan.setDateLoaned(dateLoaned);
        loan.setExpectedReturnDate(expectedReturnDate);
        loan.setDateReturned(dateReturned);
        loan.setIsReturned(true);
        loan.setNotes("Returned on time");
        loan.setOwner(owner);

        // Then
        assertThat(loan.getDateLoaned()).isBefore(loan.getDateReturned());
        assertThat(loan.getDateReturned()).isBefore(loan.getExpectedReturnDate());
        assertThat(loan.getNotes()).isEqualTo("Returned on time");
    }

    @Test
    void loan_conNotesNulas() {
        // Given
        User owner = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setWardrobe(wardrobe);

        // When
        Loan loan = Loan.builder()
                .id(3L)
                .loanedItem(shirt)
                .borrowerName("Juan")
                .dateLoaned(LocalDate.now())
                .isReturned(false)
                .owner(owner)
                .build();

        // Then
        assertThat(loan.getNotes()).isNull();
        assertThat(loan.getExpectedReturnDate()).isNull();
    }

    @Test
    void loan_cuandoAlertaPorRetraso() {
        // Given
        LocalDate dateLoaned = LocalDate.of(2026, 4, 1);
        LocalDate expectedReturnDate = LocalDate.of(2026, 4, 15);
        LocalDate today = LocalDate.of(2026, 5, 1);

        User owner = User.builder().id(1L).email("test@closet.com").name("Test").build();
        Wardrobe wardrobe = Wardrobe.builder().id(1L).name("Test Wardrobe").user(owner).build();

        Shirt shirt = new Shirt();
        shirt.setId(1L);
        shirt.setWardrobe(wardrobe);

        // When
        Loan loan = Loan.builder()
                .id(4L)
                .loanedItem(shirt)
                .borrowerName("María")
                .dateLoaned(dateLoaned)
                .expectedReturnDate(expectedReturnDate)
                .isReturned(false)
                .owner(owner)
                .build();

        // Then - loan is overdue
        assertThat(loan.getExpectedReturnDate()).isBefore(today);
        assertThat(loan.getIsReturned()).isFalse();
    }
}

