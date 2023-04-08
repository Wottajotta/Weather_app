import 'package:flutter/material.dart';

import '../utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = " ";
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var tempMin = forecastList[index].temp?.day?.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "$tempMin °C",
                      style:
                          const TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  Image.network(icon, scale: 1.2, color: Colors.white,)
                ],
              )
            ],
          ),
        ],
      ),
    ],
  );
}
