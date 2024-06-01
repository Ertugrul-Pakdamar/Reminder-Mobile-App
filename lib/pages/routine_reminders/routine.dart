
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
}