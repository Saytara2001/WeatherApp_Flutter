import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/themeProvider.dart';
import 'package:weather_app/Provider/weather_provider.dart';
import 'package:weather_app/services/Models.dart';
import 'package:weather_app/services/weather_services.dart';
class SearchPage extends StatelessWidget {
  String _cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Search City'),
      ),
      body: Container(
        color: Colors.white10,
        child: Center(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal:  10),
          child: TextField(
            decoration: InputDecoration(
              suffix: IconButton(icon: Icon(Icons.search), onPressed: ()async{
                    WeatherServices weatherServices = WeatherServices();
                    WeatherModel weatherModel = await weatherServices.fetchWeather(_cityName);
                    //provider take data
                   Provider.of<WeatherProvider>(context,listen: false).setWeather=weatherModel;
                   Provider.of<ThemeProvider>(context,listen: false).setColor=weatherModel.getThemeColor();
                   Navigator.pop(context);
              }),
              labelText: 'Search',
              border: OutlineInputBorder(),
              filled: true,
              hintText: 'Enter City Name:'
            ),
            onChanged: (value)
            {
                 print('ths is value $value');
                _cityName=value;
            },
          ),),
        ),
      ),
    );
  }
}