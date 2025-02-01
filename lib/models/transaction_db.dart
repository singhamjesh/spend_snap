import 'db.dart';

class TransactionDB {
  static Future<int> insertTransaction(
      int userId, String title, double amount, String date) async {
    final db = await DB.database;
    return await db.insert('transactions', {
      'userId': userId,
      'title': title,
      'amount': amount,
      'date': date,
    });
  }

  static Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await DB.database;
    return await db.query('transactions', orderBy: 'date DESC');
  }

  static Future<int> deleteTransaction(int id) async {
    final db = await DB.database;
    return await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}
