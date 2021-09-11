import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  final String weatherStateName;
  final double maxTemp;
  final double minTemp;
  final double theTemp;
  final String cityName;
  final TimeOfDay dataTime;
  WeatherModel({
    @required this.weatherStateName,
    @required this.maxTemp,
    @required this.minTemp,
    @required this.theTemp,
    @required this.cityName,
    @required this.dataTime,
  });
  String getImage() {
    switch (weatherStateName) {
      case 'Clear':
      case 'Light Cloud':
        return 'images/3.jpg';
        break;

      case 'Sleet':
      case 'Snow':
      case 'Hail':
        return 'images/1.png';
        break;

      case 'Heavy Cloud':
        return 'images/2.png';
        break;

      case 'Light Rain':
      case 'Heavy Rain':
      case 'Showers':
        return 'images/4.png';
        break;

      case 'ThunderStorm':
      case 'Heavy Rain':
      case 'Showers':
        return 'images/5.png';
        break;

      default:
        return 'images/3.jpg';
    }
  }

  /*
   if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'images/3.jpg';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'images/1.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'images/2.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'images/4.png';
    } else if (weatherStateName == 'ThunderStorm') {
      return 'images/5.png';
    } else {
      return 'images/3.jpg';
    }
  */
  getbackGroundColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blue;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'ThunderStorm') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

  getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'ThunderStorm') {
      return Colors.deepPurple;
    } else {
      return Colors.yellow;
    }
  }
}
