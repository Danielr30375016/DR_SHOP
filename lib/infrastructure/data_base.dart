import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseProvider {
  static final DataBaseProvider dbProvider = DataBaseProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'my_database.db');
    return await openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      await db
          .execute('CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)');
    });
  }
}
