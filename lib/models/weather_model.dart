class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
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
    );
  }

  String? getImage() {
    if (weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    }
  }
}
