import 'package:flutter/material.dart';
import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine_reminders_page.dart';
import 'package:reminder_app/pages/routine_reminders/routines_database.dart';

class CreateNewRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateNewRoutineState();
}

class CreateNewRoutineState extends State {
  RoutinesDatabase routinesDb = RoutinesDatabase();
  Routine newRoutine = Routine();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("New Routine"), backgroundColor: Colors.lightBlue),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newRoutine.title = titleController.text;
          newRoutine.description = descriptionController.text;
          var result = await routinesDb.insert(
              Routine.withoutId(titleController.text, descriptionController.text));
          Navigator.pop(context, true);
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.save),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: titleController,
              decoration: InputDecoration(labelText: "Enter Title"),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Your Text"),
            ),
          ),
        ],
      ),
    );
  }
}
