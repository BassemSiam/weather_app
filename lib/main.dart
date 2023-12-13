import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/Screens/home_screen.dart';

import 'provider/Weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getThemColor(),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
