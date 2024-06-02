import 'package:flutter/material.dart';
import 'package:reminder_app/pages/routine_reminders/create_new_routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine_page.dart';
import 'package:reminder_app/pages/routine_reminders/routines_database.dart';

class RoutineRemindersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RoutineRemindersPageState();
}

class RoutineRemindersPageState extends State {
  int currentPageIndex = 0;
  List<Routine> _routines = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      _routines.add(getRoutinesFromDatabase());
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Routine Reminders"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewRoutine,
        child: Icon(Icons.add),
        backgroundColor: Colors.amberAccent,
      ),
      body: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 525.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _routines.length,
                itemBuilder: (BuildContext context, int index) {
                  return RoutineContainerWidget(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget RoutineContainerWidget(int index) {
    var title = _routines[index].title;
    var description = _routines[index].description;
    var id = _routines[index].id;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.amberAccent.shade200),
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext) => RoutinePage(_routines[index])));
        },
        child: Expanded(
          child: Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            padding: EdgeInsets.only(left: 15, top: 10),
            color: Colors.white.withOpacity(0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      )
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {setState(() {
                      _routines.removeAt(index);
                    });},
                      icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  createNewRoutine() async {
    Routine newRoutine = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) => CreateNewRoutine()));
    setState(() {
      _routines.add(newRoutine);
      RoutinesDatabase().updateRoutines(newRoutine);
    });
  }

  getRoutinesFromDatabase() {
    if(RoutinesDatabase().database == null) {
      RoutinesDatabase().createDatabase();
      Future<List> dbRoutines = RoutinesDatabase().getRoutines();
      return dbRoutines;
    }
    else {
      Future<List> dbRoutines = RoutinesDatabase().getRoutines();
      return dbRoutines;
    }
  }
}
