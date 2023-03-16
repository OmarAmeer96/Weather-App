import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String image;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.image,
  });

  // Factory constructor ==> returns Object.
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: data["location"]["localtime"],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: data['current']['condition']['text'],
      image: data['current']['condition']['icon'],
    );
  }

  String? getImage() {
    if (weatherStateName == 'Sunny') {
      return 'assets/images/day/113.png';
    }
  }
}
