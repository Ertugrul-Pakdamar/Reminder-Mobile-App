import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/create_new_reminder.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';

class RemindersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReminderPageState();
}

class ReminderPageState extends State<RemindersPage> {
  List<Reminder> reminders = <Reminder>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewReminder,
        child: Icon(Icons.add),
        backgroundColor: Colors.amberAccent,
      ),
      body: SizedBox(
        height: 525.0,
        child: ListView.builder(
          itemCount: reminders.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => changeTaskCompleted(index),  // Düzeltildi
                    icon: isReminderCompleted(index),
                  ),
                  Text(reminders[index].text),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        reminders.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  createNewReminder() async {
    Reminder newReminder = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNewReminder()),
    );
    setState(() {
      reminders.add(newReminder);
    });
  }

  Icon isReminderCompleted(int index) {
    if (reminders[index].completed) {
      return Icon(Icons.check_box_outlined);
    } else {
      return Icon(Icons.check_box_outline_blank);
    }
  }

  void changeTaskCompleted(int index) {
    setState(() {
      reminders[index].completed = !reminders[index].completed;  // Düzeltildi
    });
  }
}
