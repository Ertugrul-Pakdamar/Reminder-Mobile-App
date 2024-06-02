
class Routine{
  int? id;
  late String title;
  late String description;

  Routine(){}

  Routine.withId(int id, String title, String description){
    if(id!=null){
      this.id = id;
      this.description = description;
      this.title = title;
    }
  }

  Routine.withoutId(String title, String description){
    this.description = description;
    this.title = title;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    if(id!=null){
      map["id"] = id;
    }
    return map;
  }

  Routine.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"]);
    this.title = o["title"];
    this.description = o["description"];
  }
}