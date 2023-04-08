import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/widgets/bottom_list_view.dart';
import 'package:weather/widgets/citi_view.dart';
import 'package:weather/widgets/detail_view.dart';
import 'package:weather/widgets/temp_view.dart';
import '../models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;
  const WeatherForecastScreen({super.key, this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  late String _cityName;
  //late String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }

    // ignore: avoid_print
    // forecastObject?.then((weather) => print(weather.list![0].weather![0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 92, 142, 236),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(232, 77, 129, 228),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text('Weather'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(
              () {
                forecastObject =
                    WeatherApi().fetchWeatherForecast(cityName: '');
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));
              if (tappedName != 0) {
                setState(
                  () {
                    _cityName = tappedName;
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  }
                );
              } else if(tappedName == null) {
                setState(() {
                  tappedName = 'Not found';
                  _cityName = tappedName;
                });
              }
            },
          ),
        ],
      ),
      body:
      ListView(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      CityView(snapshot: snapshot),
                      const SizedBox(
                        height: 50.0,
                      ),
                      TempView(snapshot: snapshot),
                      const SizedBox(
                        height: 50.0,
                      ),
                      DetailView(snapshot: snapshot),
                      const SizedBox(
                        height: 50.0,
                      ),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                      child: Text(
                    "City is not found!\n Please enter correct city",
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
