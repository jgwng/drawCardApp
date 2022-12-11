import 'package:drawcard/db/database_const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBRepository {
  Database? _database;
  static final DBRepository instance = DBRepository._init();
  DBRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mydraw.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      create table ${DBConst.tableName} ( 
      ${DBConst.id} integer primary key autoincrement, 
      ${DBConst.id} text not null,
      ${DBConst.id} text not null,
      ${DBConst.id} boolean not null)
      ''');
  }

  Future<void> insert() async {
    try {
      final db = await database;
      // db.insert(DBConst.tableName, todo.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

//   ${DBConst.id} text not null,
// ${DBConst.id} text not null,
// ${DBConst.id} boolean not null)

}
