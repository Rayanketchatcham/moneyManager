import 'package:moneymanager/Models/categorieModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('money_manager.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        ''' CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT,
     name TEXT NOT NULL)''');
  }

  // Ajouter une categorie

  Future<int> addCategorie(CategoryT category) async {
    final db = await instance.database;
    return await db.insert('categories', category.toMap());
  }

  // Recuperer toutes les categories

  Future<List<CategoryT>> getCategories() async {
    final db = await instance.database;
    final result = await db.query('categories');
    return result.map((map) => CategoryT.fromMap(map)).toList();
  }
}
