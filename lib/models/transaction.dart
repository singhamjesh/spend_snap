enum TransactionType { debited, credited }

class Transaction {
  const Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
    this.descriptions,
  });

  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final TransactionType type;
  final String? descriptions;
}
