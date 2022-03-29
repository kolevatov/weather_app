import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import '../utils/const.dart';
import '../models/weather.dart';
import '../models/location.dart';

class WeatherProvider {
  Future<WeatherForecast> fetchWeatherForcast() async {
    Location location = Location();

    // Try to get current device location
    await location.getCurrentLocation();

    // Return Error message then GEO location service isn't available
    if (!location.permissionEnabled) {
      return Future.error(location.reason.toString());
    }

    Map<String, String> params = {
      'appid': Constants.WEATHER_API_KEY,
      'units': 'metric',
      'lang': 'en',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString()
    };

    var uri = Uri.https(
        Constants.WEATHER_BASE_URL, Constants.WEATHER_FORCAST_PATH, params);

    log('https request: ' + uri.toString());

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // successful request
      log(response.body);
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      // request is failed
      return Future.error(
          'API call failed with code ' + response.statusCode.toString());
    }
  }
}
