import 'package:weather_app/utils/const.dart';

class WeatherForecast {
  City? city;
  List<WeatherList>? list;

  WeatherForecast({this.city, this.list});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    if (json['list'] != null) {
      list = <WeatherList>[];
      json['list'].forEach((v) {
        list!.add(WeatherList.fromJson(v));
      });
    }
  }
}

class City {
  int? id;
  String? name;
  String? country;

  City({this.id, this.name, this.country});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
  }
}

class WeatherList {
  int? dt;
  Temp? temp;
  int? pressure;
  int? humidity;
  List<Weather>? weather;
  double? speed;

  WeatherList(
      {this.dt,
      this.temp,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed});

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    speed = json['speed'].toDouble();
  }

  String getIconURL() {
    return Constants.WEATHER_IMAGES_URL + '${weather?[0].icon}';
  }
}

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    min = json['min'].toDouble();
    max = json['max'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['day'] = day;
  //   data['min'] = min;
  //   data['max'] = max;
  //   data['night'] = night;
  //   data['eve'] = eve;
  //   data['morn'] = morn;
  //   return data;
  // }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['main'] = this.main;
  //   data['description'] = this.description;
  //   data['icon'] = this.icon;
  //   return data;
  // }
}
