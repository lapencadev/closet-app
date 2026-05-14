import 'package:drift/drift.dart';
import 'package:mobile/services/closet_database.dart';

class LoanModel {
  final int? id;
  final int itemId;
  final String borrowerName;
  final DateTime dateLoaned;
  final DateTime? dateReturned;
  final DateTime? expectedReturnDate;
  final bool isReturned;
  final String? notes;

  LoanModel({
    this.id,
    required this.itemId,
    required this.borrowerName,
    required this.dateLoaned,
    this.dateReturned,
    this.expectedReturnDate,
    this.isReturned = false,
    this.notes,
  });

  factory LoanModel.fromEntity(Loan entity) {
    return LoanModel(
      id: entity.id,
      itemId: entity.itemId,
      borrowerName: entity.borrowerName,
      dateLoaned: entity.dateLoaned,
      dateReturned: entity.dateReturned,
      expectedReturnDate: entity.expectedReturnDate,
      isReturned: entity.isReturned,
      notes: entity.notes,
    );
  }

  LoansCompanion toCompanion() {
    return LoansCompanion.insert(
      itemId: itemId,
      borrowerName: borrowerName,
      dateLoaned: dateLoaned,
      dateReturned: Value(dateReturned),
      expectedReturnDate: Value(expectedReturnDate),
      isReturned: Value(isReturned),
      notes: Value(notes),
    );
  }
}
