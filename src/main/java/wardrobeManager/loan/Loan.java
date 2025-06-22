package wardrobeManager.loan;

import user.User;
import lombok.*;
import wardrobeManager.item.Item;
import wardrobeManager.util.AuditableEntity;
import java.time.LocalDate;
import jakarta.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "loans")
public class Loan extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate dateLoaned;
    private LocalDate dateReturned;
    private Boolean isReturned;
    private String borrowerName;

    @ManyToOne
    @JoinColumn(name="item_id", nullable = false)
    private Item loanedItem;

    @ManyToOne
    @JoinColumn(name="owner_id", nullable = false)
    private User owner;
}
