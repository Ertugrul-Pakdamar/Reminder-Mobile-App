import 'package:flutter/material.dart';
import 'package:reminder_app/pages/routine_reminders/routine.dart';
import 'package:reminder_app/pages/routine_reminders/routine_reminders_page.dart';

class CreateNewRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateNewRoutineState();
}

class CreateNewRoutineState extends State {
  Routine newRoutine = Routine();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("New Routine"), backgroundColor: Colors.lightBlue),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newRoutine.title = titleController.text;
          newRoutine.description = descriptionController.text;
          Navigator.pop(context, newRoutine);
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
