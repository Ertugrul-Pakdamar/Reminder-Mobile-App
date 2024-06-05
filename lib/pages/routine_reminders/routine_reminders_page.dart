import 'package:flutter/material.dart';
import 'package:reminder_app/pages/routine_reminders/create_new_routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine_details_page.dart';
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
              builder: (BuildContext) => RoutineDetailsPage(_routines[index])));
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          padding: EdgeInsets.only(left: 10, top: 10),
          color: Colors.white.withOpacity(0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Text(
                              title,
                              style: TextStyle(fontSize: 25),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(child: SizedBox(), flex: 1,),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Text(
                              description,
                              style: TextStyle(fontSize: 20),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(child: SizedBox(), flex: 1,),
                        ],
                      ),
                    ],
                  ),
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
    );
  }

  createNewRoutine() async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) => CreateNewRoutine()));
    if (result != null) {
      if (result) {
        getRoutines();
      }
    }
  }

  getRoutines() async {
    var routinesUpdated = routinesDb.getRoutines();
    routinesUpdated.then((value) {
      setState(() {
        this._routines = value;
      });
    });
  }
}
