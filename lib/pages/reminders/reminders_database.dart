import 'dart:async';
import 'package:reminder_app/pages/reminders/reminder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RemindersDatabase {
  Database? _db;

  Future<Database?> get db async {
    if(_db==null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database?> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), 'reminders.db');
    Future<Database> routinesDb = openDatabase(dbPath, version: 1, onCreate: createDb);

    return routinesDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Reminders(id INTEGER PRIMARY KEY, text TEXT, completed INTEGER)");
  }

  Future<List<Reminder>> getReminders() async {
    Database? db = await this.db;
    var result = await db?.query("Reminders");
    return List.generate(result!.length, (i){
      return Reminder.fromObject(result[i]);
    });
  }

  Future<int?> insert(Reminder reminder) async {
    Database? db = await this.db;
    var result = await db?.insert("Reminders", reminder.toMap());
  }

  Future<int?> delete(int id) async {
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from Reminders where id=$id");
    return result;
  }

  Future<int?> update(Reminder reminder) async {
    Database? db = await this.db;
    var result = await db?.update("Reminders", reminder.toMap(), where: "id=?", whereArgs: [reminder.id]);
    return result;
  }
}