package wardrobeManager.dto;

import org.springframework.stereotype.Component;
import wardrobeManager.loan.Loan;

@Component
public class LoanMapper {

    public LoanDTO loanToLoanDTO(Loan loan) {
        if (loan == null) {
            return null;
        }

        return LoanDTO.builder()
                .id(loan.getId())
                .itemId(loan.getLoanedItem() != null ? loan.getLoanedItem().getId() : null)
                .borrowerName(loan.getBorrowerName())
                .dateLoaned(loan.getDateLoaned())
                .dateReturned(loan.getDateReturned())
                .isReturned(loan.getIsReturned())
                .build();
    }
}


