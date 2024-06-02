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
  RoutinesDatabase routinesDb = RoutinesDatabase();
  List<Routine> _routines = [];

  @override
  void initState() {
    getRoutines();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
          backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.amberAccent.shade200),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext) => RoutinePage(_routines[index])));
        },
        child: Expanded(
          child: Container(
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
                    onPressed: () {
                      routinesDb.delete(_routines[index].id!);
                      getRoutines();
                    },
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
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) => CreateNewRoutine()));
    if(result!=null) {
      if(result) {
        getRoutines();
      }
    }
  }

  getRoutines() async {
    var productsFuture = routinesDb.getRoutines();
    productsFuture.then((value) {
      setState(() {
        this._routines = value;
      });
    });
  }
}
