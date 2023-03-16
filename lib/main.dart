import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
