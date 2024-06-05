import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';
import 'package:reminder_app/pages/reminders/reminders_database.dart';

class RemindersDetailsPage extends StatefulWidget {
  late int reminderId;
  late bool reminderCompleted;
  RemindersDetailsPage(int reminderId, bool reminderCompleted) {
    this.reminderId = reminderId;
    this.reminderCompleted = reminderCompleted;
  }

  @override
  State<StatefulWidget> createState() => RemindersDetailsPageState(reminderId);
}

class RemindersDetailsPageState extends State {
  RemindersDatabase remindersDb = RemindersDatabase();
  Reminder newReminder = Reminder();
  List<Reminder> reminders = [];
  TextEditingController textController = TextEditingController();
  late int reminderId;
  late bool reminderCompleted;

  RemindersDetailsPageState(int reminderId, bool reminderCompleted) {
    this.reminderId = reminderId;
    this.reminderCompleted = reminderCompleted;
  }

  @override
  void initState() {
    getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Reminder Details"), backgroundColor: Colors.lightBlue),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newReminder.text = textController.text;
          var result = await remindersDb
              .update(Reminder.withInfo(reminderId, textController.text, reminderCompleted));
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
