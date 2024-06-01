import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';
import 'package:reminder_app/pages/routine_reminders/routine.dart';

class RoutinePage extends StatefulWidget {
  Routine _routine = Routine();
  RoutinePage(Routine routine) {
    this._routine = routine;
  }

  @override
  State<StatefulWidget> createState() => RoutinePageState(_routine);
}

class RoutinePageState extends State {
  Routine routine = Routine();
  RoutinePageState(Routine routine) {
    this.routine = routine;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${routine.title} Routine"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        height: 525.0,
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Text(
                        routine.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )
                    )
                ),
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Text(routine.description),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
