import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  final String tableUser = 'users';
  final String idUser = 'id';
  final String emailUser = 'email';
  final String passwordUser = 'password';
  final String activedUser = 'active';
  final String lastLoginUser = 'lastLogin';

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String directory = await getDatabasesPath();
    String dbPath = join(directory, 'database.db');
    var database = openDatabase(
        dbPath, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $tableUser($emailUser TEXT, $passwordUser TEXT, $activedUser INTEGER , $lastLoginUser TEXT)');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }
}