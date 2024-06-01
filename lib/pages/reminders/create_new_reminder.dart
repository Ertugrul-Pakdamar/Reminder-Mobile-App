import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';

class CreateNewReminder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CreateNewReminderState();
}

class CreateNewReminderState extends State{
  Reminder newReminder = Reminder();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text("New Reminder"), backgroundColor: Colors.lightBlue),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newReminder.text = textController.text;
          newReminder.completed = false;
          Navigator.pop(context, newReminder);
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
              controller: textController,
              decoration: InputDecoration(labelText: "Enter Title"),
            ),
          ),
        ],
      ),
    );
  }
}