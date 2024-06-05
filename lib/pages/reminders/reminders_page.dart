import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/create_new_reminder.dart';
import 'package:reminder_app/pages/reminders/reminder.dart';
import 'package:reminder_app/pages/reminders/reminders_database.dart';
import 'package:reminder_app/pages/reminders/reminders_details_page.dart';

class RemindersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReminderPageState();
}

class ReminderPageState extends State<RemindersPage> {
  RemindersDatabase remindersDb = RemindersDatabase();
  List<Reminder> reminders = <Reminder>[];
  int latestId = 0;

  @override
  void initState() {
    getReminders();
  }

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
            return ElevatedButton(
              onPressed: () => goToReminderDetails(reminders[index]),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => changeTaskCompleted(index),
                      icon: isReminderCompleted(index),
                    ),
                    Flexible(
                      child: Text(reminders[index].text,
                        style: TextStyle(decoration: isTextLined(reminders[index].completed!)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () => deleteReminder(index),
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  createNewReminder() async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext) => CreateNewReminder(setLatestId())));
    if (result != null) {
      if (result) {
        getReminders();
      }
    }
  }

  Icon isReminderCompleted(int index) {
    if (reminders[index].completed!) {
      return Icon(Icons.check_box_outlined);
    } else {
      return Icon(Icons.check_box_outline_blank);
    }
  }

  void changeTaskCompleted(int index) {
    reminders[index].completed = !reminders[index].completed!;
    remindersDb.update(reminders[index]);
    getReminders();
  }

  getReminders() async {
    var remindersUpdated = remindersDb.getReminders();
    remindersUpdated.then((value) {
      setState(() {
        this.reminders = value;
      });
    });
  }

  deleteReminder(int index) {
    remindersDb.delete(reminders[index].id);
    getReminders();
  }

  setLatestId() {
    if(reminders.isNotEmpty){
      latestId = reminders.last.id + 1;
    }
    else {
      latestId = 0;
    }
    return latestId;
  }

  isTextLined(bool isCompleted) {
    if(isCompleted) {
      return TextDecoration.lineThrough;
    }
    else {
      return TextDecoration.none;
    }
  }

  goToReminderDetails(Reminder reminder) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext) => RemindersDetailsPage(reminder)));
    if (result != null) {
      if (result) {
        getReminders();
      }
    }
  }
}
