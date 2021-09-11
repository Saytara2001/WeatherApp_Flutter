import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/services/Models.dart';
import 'package:http/http.dart' as http;
class WeatherServices
{
  Future <WeatherModel> fetchWeather(String cityName) async
  {
    int id = await fetchCityId(cityName);
    try{
      http.Response response = await http.get('https://www.metaweather.com/api/location/$id/');
      var jsonMap = jsonDecode(response.body);
      var jsonData = jsonMap['consolidated_weather'][0];
      WeatherModel weatherModel = WeatherModel(
        cityName: jsonMap['title'],
        maxTemp: jsonData['max_temp'],
        minTemp: jsonData['min_temp'],
        theTemp: jsonData['the_temp'],
        dataTime: TimeOfDay.now(),
        weatherStateName: jsonData['weather_state_name'],
      );
      return weatherModel;
    }catch(ex)
    {
      print(ex);
    }
  }
  Future<int> fetchCityId(String cityName) async
  {
    try
    {
      http.Response response = await http.get('https://www.metaweather.com/api/location/search/?query=$cityName');
      var jsonMap = jsonDecode(response.body)[0];
      int id = jsonMap['woeid'];
      return id;
    }catch(ex)
    {
      print(ex);
    }
  }
}
