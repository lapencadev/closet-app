import 'package:drift/drift.dart';
import 'package:mobile/services/closet_database.dart';

class LoanModel {
  final int? id;
  final int itemId;
  final String borrowerName;
  final DateTime dateLoaned;
  final DateTime? dateReturned;
  final bool isReturned;

  LoanModel({
    this.id,
    required this.itemId,
    required this.borrowerName,
    required this.dateLoaned,
    this.dateReturned,
    this.isReturned = false,
  });

  factory LoanModel.fromEntity(Loan entity) {
    return LoanModel(
      id: entity.id,
      itemId: entity.itemId,
      borrowerName: entity.borrowerName,
      dateLoaned: entity.dateLoaned,
      dateReturned: entity.dateReturned,
      isReturned: entity.isReturned,
    );
  }

  LoansCompanion toCompanion() {
    return LoansCompanion.insert(
      itemId: itemId,
      borrowerName: borrowerName,
      dateLoaned: dateLoaned,
      dateReturned: Value(dateReturned),
      isReturned: Value(isReturned),
    );
  }
}
