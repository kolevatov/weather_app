import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailsView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = (forecastList![0].pressure! * 0.750062).round();
    var humidity = forecastList[0].humidity?.round();
    var speed = forecastList[0].speed?.round();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Pressure
        buildCard(context, FontAwesomeIcons.thermometerHalf, pressure, 'mmHg'),
        // Humidity
        buildCard(context, FontAwesomeIcons.cloudRain, humidity!, '%'),
        // Wind speed
        buildCard(context, FontAwesomeIcons.wind, speed!, 'mps'),
      ],
    );
  }

  // Build Card for weather details
  Widget buildCard(
      BuildContext context, IconData iconData, int value, String valueDesc) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          size: 30.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(value.toString(), style: Theme.of(context).textTheme.bodyMedium),
        Text(valueDesc, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 4.0,
        ),
      ],
    );
  }
}
