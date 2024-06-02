import 'dart:async';

import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RoutinesDatabase {
  Database? _db;

  Future<Database?> get db async {
    if(_db==null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database?> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), 'routines.db');
    Future<Database> routinesDb = openDatabase(dbPath, version: 1, onCreate: createDb);

    return routinesDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Routines(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
  }

  Future<List<Routine>> getRoutines() async {
    Database? db = await this.db;
    var result = await db?.query("Routines");
    return List.generate(result!.length, (i){
      return Routine.fromObject(result?[i]);
    });
  }

  Future<int?> insert(Routine routine) async {
    Database? db = await this.db;
    var result = await db?.insert("Routines", routine.toMap());
  }

  Future<int?> delete(int id) async {
    Database? db = await this.db;
    var result = await db?.rawDelete("delete from Routines where id=$id");
    return result;
  }

  Future<int?> update(Routine routine) async {
    Database? db = await this.db;
    var result = await db?.update("Routines", routine.toMap(), where: "id=?", whereArgs: [routine.id]);
    return result;
  }
}