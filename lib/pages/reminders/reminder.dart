
class Reminder{
  int? id;
  late String text;
  late bool completed;

  Reminder(){}

  Reminder.withInfo(int id, String text, bool completed){
    this.id = id;
    this.text = text;
    this.completed = completed;
  }

  Reminder.WithoutId(String text, bool completed){
    this.text = text;
    this.completed = completed;
  }
}