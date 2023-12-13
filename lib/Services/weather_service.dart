import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/Weather_Model.dart';

class weatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'c98fbdd6250f4194b81133247232907';

  Future<WeatherModel?> getWeather({required String cityName}) async {
     WeatherModel? Weather;
    try {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    Weather = WeatherModel.fromJson(data);
  }catch(e){
    print(e);
  }
    return Weather;
    
  }
}

































    //////////////////////// anther solution using the basic constractor /////////////////

    // var json = data['forecast']['forecastday'][0];
    // WeatherModel Weather = WeatherModel(
    //     date: data['location']['localtime'],
    //     temp: json['avgtemp_c'],
    //     maxTemp: json['maxtemp_c'],
    //     minTemp: json['mintemp_c'],
    //     weatherStateName: json['condition']['text']);
  
