import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widgets/details_view.dart';
import '../api/weather_api.dart';

import '../models/weather.dart';
import '../widgets/city_view.dart';
import '../widgets/temperature_view.dart';
import '../widgets/weekly_forecast.dart';

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({Key? key}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late Future<WeatherForecast> forecastObject;

  @override
  void initState() {
    super.initState();

    forecastObject = WeatherProvider().fetchWeatherForcast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

// AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Weather forecast'),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      //backgroundColor: Colors.red,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            // refresh GEO location and fetch new forecast
            setState(() {
              forecastObject = WeatherProvider().fetchWeatherForcast();
            });
          },
          icon: const Icon(
            Icons.sync,
          ),
        );
      }),
    );
  }

  // Body
  Widget _buildBody() {
    return
        // ListView(
        //   children: <Widget>[
        FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 16.0,
                    ),
                    CityView(snapshot: snapshot),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TempView(snapshot: snapshot),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DetailsView(snapshot: snapshot),
                    _textLabel(context),
                    WeeklyForecast(
                      snapshot: snapshot,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Container(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ));
              } else {
                return Container(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ));
              }
            });
    //   ],
    // );
  }
}

Container _textLabel(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 32.0),
    child: Text(
      '7-DAY WEATHER FORECAST',
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}
