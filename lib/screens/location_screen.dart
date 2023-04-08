import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getCurrentLocationData() async {
    try{
      var weatherInfo = await WeatherApi().fetchWeatherForecast(cityName: '');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(locationWeather: weatherInfo);  
    }));
    }catch(e) {
      if (kDebugMode) {
        print("$e");
      }
   }
    }


  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(232, 92, 142, 236),
      body:  Center(child: SpinKitDoubleBounce(color: Colors.white, size: 100,)),
    );
  }

}