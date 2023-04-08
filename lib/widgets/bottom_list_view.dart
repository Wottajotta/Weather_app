import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("7-DAY WEATHER FORECAST".toUpperCase(),
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data!.list!.length,
            itemBuilder: (context, index) => Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
