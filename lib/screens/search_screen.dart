import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
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
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              hintText: "Enter a City",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Icon(Icons.search),
              ),
              label: const Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
