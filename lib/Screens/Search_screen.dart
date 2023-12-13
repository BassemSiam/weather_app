import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/Shared/Consts.dart';
import 'package:weather_app/provider/Weather_provider.dart';

class SearchScrean extends StatelessWidget {
  String? cityName;
  SearchScrean();
  var SearchController = TextEditingController();

  var formKeyCity = GlobalKey<FormState>();

  // SearchScean({this.updateUi});
  // VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    cityName = SearchController.text;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: formKeyCity,
              child: TextField(
                controller: SearchController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'pleasr enter the city name';
                //   }
                // },
                onChanged: (value) {
                  cityName = value;
                },
                onSubmitted: (value) async {
                  if (SearchController.value.text.isEmpty) {
                     'please enter the city name ';
                  }
                  if (formKeyCity.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: LinearProgressIndicator()),
                    );
                  }

                  //cityName = value;
                  weatherService service = weatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  //WeatheData = weather;
                  //updateUi!();
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  hintText: 'Enter City Name',
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () async {
                        if (formKeyCity.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: LinearProgressIndicator()),
                          );
                        }

                        weatherService service = weatherService();
                        WeatherModel? weather =
                            await service.getWeather(cityName: cityName!);

                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;

                        //WeatheData = weather;
                        //updateUi!();
                        Navigator.pop(context);
                      }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
