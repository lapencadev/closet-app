package wardrobeManager.loan;

import User.User;
import lombok.*;
import wardrobeManager.item.Item;
import wardrobeManager.util.AuditableEntity;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "LOAN")
public class Loan extends AuditableEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate dateLoaned;
    private LocalDate dateReturned;
    private Boolean isReturned;
    private String borrowerName;
    @ManyToOne
    @JoinColumn(name="item_id")
    private Item loanedItem;
    @ManyToOne
    @JoinColumn(name="owner_id")
    private User owner;
}
