import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../utils/utils.dart';

class WeeklyForecast extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const WeeklyForecast({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot.data?.list;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: forecastList!.length - 1,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width / 2.7,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: _buildCard(context, index),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 8.0,
          ),
        ),
      ),
    );
  }

  // Build card with one day forecast for list
  Widget _buildCard(BuildContext context, int index) {
    var forecastList = snapshot.data?.list;
    String dayOfWeek = '';
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
    dayOfWeek = Utils.getFormattedDate(date).split(',')[0];

    var temperature = forecastList[index].temp?.day?.toStringAsFixed(0);
    var minDay = forecastList[index].temp?.min?.toStringAsFixed(0);
    var maxDay = forecastList[index].temp?.max?.toStringAsFixed(0);
    var tempNight = forecastList[index].temp?.night?.toStringAsFixed(0);
    var icon = forecastList[index].getIconURL();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          dayOfWeek,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Image.network(
          icon,
          scale: 0.9,
        ),
        Text(
          '$temperature °C  ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'day: min $minDay °C | max $maxDay °C',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          'night:  $tempNight °C',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
