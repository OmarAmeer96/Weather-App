import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  void getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String apiKey = "6013737c20ce42b2a6e173901231503";
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    String date = data["location"]["localtime"];
    String temp = data['forecast']['forecastday'][0]['avgtemp_c'];
  }
}
