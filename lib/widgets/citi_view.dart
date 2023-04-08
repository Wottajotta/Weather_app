import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data!.city?.name;
    var country = snapshot.data!.city?.country;
    var formattedDate = DateTime.fromMicrosecondsSinceEpoch(forecastList![0].dt! * 1000000);
    return Column(children: [
      Center(child:
      Text(
        "$city, $country",
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.white),
      ),),
      Text(Util.getFormattedDate(formattedDate), style: const TextStyle(fontSize: 15.0, color: Colors.white),)
    ]);
  }
}
