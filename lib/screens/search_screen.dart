import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;

  SearchScreen({super.key, this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context).weatherData = weather;
              updateUi!();
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              hintText: "Enter a City",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
