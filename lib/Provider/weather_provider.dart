import 'package:flutter/cupertino.dart';
import 'package:weather_app/services/Models.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel _weatherModel;

    set setWeather(WeatherModel weatherModel)
    {
      this._weatherModel=weatherModel;
      notifyListeners();
    }

    WeatherModel get getWeatherModel
    {
      return _weatherModel;
    }

}