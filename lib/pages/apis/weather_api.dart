import 'package:http/http.dart' as http;

class WeatherApi{
  String apiKey = "YOUR-API-KEY";
  String location = "İstanbul";
  late Uri url;

  Future getWeatherApi() async {
    url = Uri.http("api.weatherapi.com", "/v1/current.json", {"key": apiKey, "q": location, "aqi": "no"});
    return http.get(url);
  }
}
