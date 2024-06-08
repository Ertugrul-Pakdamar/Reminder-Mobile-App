import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reminder_app/pages/apis/weather_api.dart';
import 'package:reminder_app/pages/models/weather.dart';

class WeatherWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget> {
  Weather? weather;
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    getWeatherFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 215,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : buildWeatherInfo(), // Show weather info
    );
  }

  Widget buildWeatherInfo() {
    return Column(
      children: [
        SizedBox(height: 5),
        Image.network("https:${weather!.current.condition.iconUrl}", scale: 0.5),
        SizedBox(height: 1),
        Text(weather!.current.temp_c.toString(), style: TextStyle(fontSize: 25)),
        Expanded(child: SizedBox()),
        Row(
          children: [
            Expanded(child: SizedBox()),
            Icon(Icons.location_on),
            SizedBox(width: 5),
            Text(weather!.location.name),
            Expanded(child: SizedBox()),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }

  void getWeatherFromApi() {
    WeatherApi().getWeatherApi().then((response) {
      setState(() {
        isLoading = false; // Update loading state
        this.weather = Weather.fromJson(jsonDecode(response.body));
      });
    });
  }
}
