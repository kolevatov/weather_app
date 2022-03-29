import 'package:flutter/material.dart';
import 'package:weather_app/pages/forcast_page.dart';
import 'package:weather_app/theme/theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: weatherTheme,
      home: const WeatherForecastPage(),
    );
  }
}
