import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DB {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize FFI for desktop support
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE
          )
        ''');
            await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER NOT NULL,
            title TEXT NOT NULL,
            amount REAL NOT NULL,
            date TEXT NOT NULL,
            FOREIGN KEY (userId) REFERENCES users (id)
          )
        ''');
          },
        ));
  }
}
