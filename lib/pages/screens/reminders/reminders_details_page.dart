import 'package:flutter/material.dart';
import 'package:reminder_app/pages/database/reminders_database.dart';
import 'package:reminder_app/pages/models/reminder.dart';

class RemindersDetailsPage extends StatefulWidget {
  late Reminder reminder;
  RemindersDetailsPage(Reminder reminder) {
    this.reminder = reminder;
  }

  @override
  State<StatefulWidget> createState() => RemindersDetailsPageState(reminder);
}

class RemindersDetailsPageState extends State {
  RemindersDatabase remindersDb = RemindersDatabase();
  Reminder newReminder = Reminder();
  List<Reminder> reminders = [];
  TextEditingController textController = TextEditingController();
  late Reminder reminder;

  RemindersDetailsPageState(Reminder reminder) {
    this.reminder = reminder;
  }

  @override
  void initState() {
    textController.text = reminder.text;
    getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Reminder Details"), backgroundColor: Colors.amber),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newReminder.text = textController.text;
          var result = await remindersDb.update(Reminder.withInfo(
              reminder.id, textController.text, reminder.completed!));
          Navigator.pop(context, true);
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.save, color: Color(0xff614151)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: textController,
              decoration: InputDecoration(
                labelText: "Enter Title",
              ),
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
