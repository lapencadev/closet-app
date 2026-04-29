import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/loan_model.dart';
import 'package:mobile/services/closet_database.dart';

void main() {
  group('LoanModel', () {
    final now = DateTime.now();

    test('fromEntity should correctly map Loan to LoanModel', () {
      final entity = Loan(
        id: 1,
        itemId: 5,
        borrowerName: 'John Doe',
        dateLoaned: now,
        isReturned: false,
      );

      final model = LoanModel.fromEntity(entity);

      expect(model.id, 1);
      expect(model.itemId, 5);
      expect(model.borrowerName, 'John Doe');
      expect(model.dateLoaned, now);
      expect(model.isReturned, false);
    });

    test('toCompanion should correctly map LoanModel to LoansCompanion', () {
      final model = LoanModel(
        itemId: 10,
        borrowerName: 'Jane Smith',
        dateLoaned: now,
      );

      final companion = model.toCompanion();

      expect(companion.itemId.value, 10);
      expect(companion.borrowerName.value, 'Jane Smith');
      expect(companion.dateLoaned.value, now);
      expect(companion.isReturned.value, false);
    });
  });
}
