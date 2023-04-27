import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await openDatabase(
      // ruta y nombre de la base de datos
      join(await getDatabasesPath(), 'my_database.db'),
      // Crear la tabla si no existe
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      // Incrementar la versión de la base de datos si es necesario
      version: 1,
    );
    return _database!;
  }

  Future<void> insertData(String name) async {
    final db = await database;
    await db.insert(
      'my_table',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    return db.query('my_table');
  }

  Future<void> updateData(int id, String name) async {
    final db = await database;
    await db.update(
      'my_table',
      {'name': name},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
