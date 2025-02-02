import 'dart:io';
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
    final dbPath = await _getDatabasePath();
    final path = join(dbPath, 'spend_snap_database.db');

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
            title TEXT NOT NULL,
            amount DOUBLE NOT NULL,
            date DATETIME NOT NULL,
            type TEXT NOT NULL,
            category TEXT NOT NULL,
            descriptions TEXT NULL
          )
        ''');
          },
        ));
  }

  static Future<String> _getDatabasePath() async {
    try {
      final dbPath = await databaseFactory.getDatabasesPath();
      final directory = Directory(dbPath);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      return dbPath;
    } catch (e) {
      // Handle the error gracefully, possibly by using a fallback path
      print('Error getting database path: $e');
      return Directory.systemTemp.path; // Use system temporary directory as fallback
    }
  }
}
