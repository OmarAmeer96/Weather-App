import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';

import '../providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen(
                      updateUi: updateUi,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text("Weather App"),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "There's no weather 😔 start",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Searching now 🔍...",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated: ${weatherData!.date}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https:${weatherData!.image}',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          // Display a placeholder image or error message
                          return const Icon(Icons.error);
                        },
                      ),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max Temp = ${weatherData!.maxTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Min Temp  = ${weatherData!.minTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    // Because of the (Null Safety). ==> can be too: weatherData?.weatherStateName??''.
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
    );
  }
}
