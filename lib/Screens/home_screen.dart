import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/Screens/Search_screen.dart';
import 'package:weather_app/Shared/Consts.dart';
import 'package:weather_app/provider/Weather_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void updateUi() {
  //   setState(() {});
  // }

  WeatherModel? WeatherData;
  @override
  Widget build(BuildContext context) {
    WeatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SearchScrean(
                      // updateUi: updateUi,
                      );
                }),
              );
            },
          ),
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ WeatherData!.getThemColor(), 
                  WeatherData!.getThemColor()[300]!,
                  WeatherData!.getThemColor()[100]!,
                  
                ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName ?? 'No city',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated at: ${WeatherData!.date!.hour.toString()}:${WeatherData!.date!.minute.toString()}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(WeatherData!.getImage()),
                      Text(
                        '${WeatherData!.temp!.toInt()}',
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Max temp :  ${WeatherData!.maxTemp!.toInt()}',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                          Text('Min temp : ${WeatherData!.minTemp!.toInt()}',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    WeatherData!.weatherStateName.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
