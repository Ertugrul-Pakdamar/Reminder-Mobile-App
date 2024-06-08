import 'package:flutter/material.dart';
import 'package:reminder_app/pages/models/routine.dart';

class RoutineDetailsPage extends StatefulWidget {
  Routine _routine = Routine();
  RoutineDetailsPage(Routine routine) {
    this._routine = routine;
  }

  @override
  State<StatefulWidget> createState() => RoutineDetailsPageState(_routine);
}

class RoutineDetailsPageState extends State {
  Routine routine = Routine();
  RoutineDetailsPageState(Routine routine) {
    this.routine = routine;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${routine.title} Routine",
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.amber,
      ),
      body: SizedBox(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Expanded(
                  flex: 25,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 100,
                        child: SingleChildScrollView(
                          child: Text(routine.title,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                        ),
                      ),
                      Expanded(child: SizedBox(), flex: 1,),
                    ],
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Text(
                        routine.description,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
