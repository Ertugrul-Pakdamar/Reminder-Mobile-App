import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RoutinesDatabase {
  Database? database;

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE Routines ("
        "id INTEGER PRIMARYKEY,"
        "title TEXT,"
        "description TEXT,"
        ")");
  }

  Future<int?> createRoutine(Routine routine) async {
    var result = await database?.insert("Routines", routine.toMap());
    return result;
  }

  Future<List> getRoutines() async {
    var result = await database
        ?.query("Routines", columns: ["id", "title", "description"]);

    return result!.toList();
  }

  Future<int?> updateCustomer(Routine routine) async {
    return await database?.update("Routines", routine.toMap(),
        where: "id = ?", whereArgs: [routine.id]);
  }

  Future<int?> deleteCustomer(int id) async {
    return await database?.delete("Routines", where: 'id = ?', whereArgs: [id]);
  }
}
