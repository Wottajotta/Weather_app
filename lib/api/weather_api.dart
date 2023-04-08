import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/constants.dart';

import '../utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {required String cityName, bool? isCity}) async {

    Location location = Location();
    await location.getCurrentLocation();
 
    Map<String,String> parameters;

    if(isCity == true) {
       var queryParameters = {
      "APPID": Constansts.WEATHER_APP_ID,
      "units": "metric",
      "q": cityName,
    };
    parameters = queryParameters;
    }
    else{
      var queryParameters = {
      "APPID": Constansts.WEATHER_APP_ID,
      "units": "metric",
      "lat": location.latitude.toString(),
      "lon": location.longtitude.toString()
    };
    parameters = queryParameters;
    }

    

    var uri = Uri.https(Constansts.WEATHER_BASE_URL_DOMAIN,
        Constansts.WEATHER_FORECAST_PATH, parameters);


    log("request: ${uri.toString()}");

    var response = await http.get(uri);

    if (kDebugMode) {
      print("response: ${response.body}");
    }

    if(response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    }
    else {
      return Future.error("Error response");
    }
  }
}
