import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';
import 'package:reminder_app/pages/reminders/reminders_database.dart';

class CreateNewReminder extends StatefulWidget {
  late int latestId;
  CreateNewReminder(int latestId) {
    this.latestId = latestId;
  }

  @override
  State<StatefulWidget> createState() => CreateNewReminderState(latestId);
}

class CreateNewReminderState extends State {
  RemindersDatabase remindersDb = RemindersDatabase();
  Reminder newReminder = Reminder();
  List<Reminder> reminders = [];
  TextEditingController textController = TextEditingController();
  late int latestId = 0;

  CreateNewReminderState(int latestId) {
    this.latestId = latestId;
  }

  @override
  void initState() {
    getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("New Reminder"), backgroundColor: Colors.lightBlue),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newReminder.text = textController.text;
          newReminder.completed = false;
          var result = await remindersDb
              .insert(Reminder.withInfo(latestId, textController.text, false));
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
              controller: textController,
              decoration: InputDecoration(labelText: "Enter Title"),
            ),
          ),
        ],
      ),
    );
  }

  getReminders() async {
    var remindersUpdated = remindersDb.getReminders();
    remindersUpdated.then((value) {
      setState(() {
        this.reminders = value;
      });
    });
  }
}
