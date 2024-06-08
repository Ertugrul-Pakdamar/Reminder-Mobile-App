
class Weather {
  late Location location;
  late Current current;

  Weather.fromJson(Map<String, dynamic> json) {
    this.location = Location.fromJson(json["location"]);
    this.current = Current.fromJson(json["current"]);
  }
}


class Location{
  late String name;
  late String country;

  Location.fromJson(Map json) {
    this.name = json["name"];
    this.country = json["country"];
  }
}

class Current{
  late double temp_c;
  late double temp_f;
  late Condition condition;

  Current.fromJson(Map json) {
    this.temp_c = json["temp_c"];
    this.temp_f = json["temp_f"];
    this.condition = Condition.fromJson(json["condition"]);
  }
}

class Condition{
  late String text;
  late String iconUrl;

  Condition.fromJson(Map json) {
    this.text = json["text"];
    this.iconUrl = json["icon"];
  }
}