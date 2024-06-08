
class Reminder{
  late int id;
  late String text;
  late bool? completed;

  Reminder(){}

  Reminder.withInfo(int id, String text, bool completed){
    this.id = id;
    this.text = text;
    this.completed = completed;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["text"] = text;
    map["completed"] = 0;

    if(completed! == true) {
      map["completed"] = 1;
    }
    else {
      map["completed"] = 0;
    }

    if(id!=null){
      map["id"] = id;
    }
    return map;
  }

  Reminder.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString())!;
    this.text = o["text"];
    if(int.tryParse(o["completed"].toString()) == 0){
      this.completed = false;
    }
    else {
      this.completed = true;
    }
  }
}