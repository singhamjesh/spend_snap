import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../data/transaction_db.dart';

class TransactionNotifier extends StateNotifier<List<Transaction>> {
  TransactionNotifier() : super([]);

  Future<void> loadTransactions() async {
    final List<Map<String, dynamic>> maps = await TransactionDB.get();

    state = List.generate(maps.length, (i) {
      return Transaction(
        title: maps[i]['title'],
        amount: maps[i]['amount'].toDouble(), // Fix: Ensure amount is a double
        date: DateTime.parse(maps[i]['date']),
        category: maps[i]['category'],
        type: maps[i]['amount'] >= 0
            ? TransactionType.credited
            : TransactionType.debited,
        descriptions: maps[i]['descriptions'],
      );
    });
  }

  Future<void> addTransaction(Transaction transaction) async {
    final payload = {
      'title': transaction.title,
      'amount': transaction.amount,
      'date': transaction.date.toIso8601String(),
      'category': transaction.category,
      'type': 'debited',
      'descriptions': transaction.descriptions,
    };
    await TransactionDB.save(payload);
    loadTransactions();
  }

  Future<void> deleteTransaction(int id) async {
    await TransactionDB.delete(id);
    loadTransactions();
  }
}

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, List<Transaction>>((ref) {
  final notifier = TransactionNotifier();
  notifier.loadTransactions();
  return notifier;
});
