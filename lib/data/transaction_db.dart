import 'db.dart';

class TransactionDB {
  static Future<int> save(Map<String, dynamic> payload) async {
    final db = await DB.database;
    return await db.insert('transactions', payload);
  }

  static Future<List<Map<String, dynamic>>> get() async {
    final db = await DB.database;
    return await db.query('transactions', orderBy: 'date DESC');
  }

  static Future<int> delete(int id) async {
    final db = await DB.database;
    return await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}
