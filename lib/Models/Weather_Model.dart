import 'package:flutter/material.dart';

class WeatherModel {
  DateTime? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  // factory
  WeatherModel.fromJson(Map<String, dynamic> data) {
    var json = data['forecast']!['forecastday'][0]['day'] ;
    date = DateTime.parse(data['location']['localtime']);
    temp = json['avgtemp_c'];
    maxTemp = json['maxtemp_c'];
    minTemp = json['mintemp_c'];
    weatherStateName = json['condition']['text'];
  }

  String getImage() {
    if (weatherStateName == 'clear' || weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloud.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemColor() {
    if (weatherStateName == 'clear' || weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return Colors.amber;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return  Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return  Colors.blueGrey;

    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Showers') {
      return  Colors.teal;
      

    } else if (weatherStateName == 'Thunderstorm') {
      return  Colors.brown;
      
    } else {
      return  Colors.deepOrange;
    }

//anther solution  and we can do it to other paramters
    //// temp = data['forecast']['forecastday'][0]['avgtemp_c'];

/////// anther soulution of using factory constracor using this it is
    /// how to make a fromjson return a class model and put the data in it and solve the nunNulabel  ///////
    // return WeatherModel(
    //     date: data['location']['localtime'],
    //     temp: json['avgtemp_c'],
    //     maxTemp: json['maxtemp_c'],
    //     minTemp: json['mintemp_c'],
    //     weatherStateName: json['condition']['text']);
  }
}
