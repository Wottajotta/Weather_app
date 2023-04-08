import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp?.day?.toStringAsFixed(0);
    var description = forecastList?[0].weather?[0].description?.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon!,
          scale: 0.4,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          children: [
            Text(
              "$temp °C",
              style: const TextStyle(fontSize: 54.0, color: Colors.white),
            ),
            Text("$description", style: const TextStyle(fontSize: 18.0, color: Colors.white),)
          ],
        ),
      ],
    );
  }
}
