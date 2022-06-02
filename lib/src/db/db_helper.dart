import 'package:prophetic_prayers_for_children/src/services/reminder.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tablename = 'reminders';

  static Future<void> initBD() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'reminders.db';
      _db = await openDatabase(
          _path,
          version: _version,
          onCreate: (db, version) {
            print('creating a new database');
            return db.execute(
            "CREATE TABLE $_tablename("
                "id INTEGER PRIMARY KEY AUTOINCREMRNT,"
                "title String, note TEXT, date String, "
                "time String,"
                "remind INTEGER, "
                "color INTTEGER, "
                "isCompleted INTEGER "
            );
          }
      );
    } catch(e){
      print(e);
    }
  }

  static Future<int> insert(Reminder? reminder) async {
    print("insert Function called");
    return await _db?.insert(_tablename, reminder!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Query function called");
    return await _db!.query(_tablename);
  }

  static delete(Reminder reminder) {
    _db!.delete(_tablename, where:"id=?", whereArgs: [reminder.id]);
  }

  static update (int id) async{
    await _db!.rawUpdate('''
      UPDATE reminders
      SET isCompleted = ?
      WHERE id =?
    ''', [1, id]);
  }
}