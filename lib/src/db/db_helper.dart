import 'package:prophetic_prayers_for_children/src/services/reminder.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "reminders";

  static Future<void> initDb() async {
    if(_db !=null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}reminders.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print("Creating a new Database");
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "title STRING, note TEXT, date STRING, "
                "time String, remind INTEGER, repeat STRING,"
                "color INTEGER, "
                "isCompleted INTEGER)"
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Reminder reminder) async {
    print('insert function called');
    return await _db?.insert(_tableName, reminder.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Reminder reminder) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [reminder.id]);
  }


}