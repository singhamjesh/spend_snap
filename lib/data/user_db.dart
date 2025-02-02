import 'db.dart';

class UserDB {
  static Future<int> insertUser(String name, String email) async {
    final db = await DB.database;
    return await db.insert('users', {
      'name': name,
      'email': email,
    });
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DB.database;
    return await db.query('users', orderBy: 'name ASC');
  }

  static Future<int> deleteUser(int id) async {
    final db = await DB.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
