import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

import '../models/weather.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var currentDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('$city, $country',
            style: Theme.of(context).textTheme.headlineMedium),
        Text(Utils.getFormattedDate(currentDate),
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
