import 'package:flutter/material.dart';
import '../models/weather.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var temperature = forecastList?[0].temp?.day?.toStringAsFixed(0);
    var weatherDesc = forecastList?[0].weather?[0].main?.toUpperCase();
    var icon = forecastList?[0].getIconURL();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          icon!,
          scale: 0.5,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Column(
          children: <Widget>[
            // Display current day temperature
            Text('$temperature °C',
                style: Theme.of(context).textTheme.headlineLarge),
            Text(
              '$weatherDesc',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ],
    );
  }
}
