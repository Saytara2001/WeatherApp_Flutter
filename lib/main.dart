import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/HomePage.dart';
import 'package:weather_app/Provider/themeProvider.dart';
import 'package:weather_app/Provider/weather_provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
          create: (context)=>WeatherProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context)=>ThemeProvider(),
        ),
      ],
      child: Weather()));
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData.light().copyWith(
          primaryColor: Provider.of<ThemeProvider>(context).getColor
      ),
      home: Scaffold(
          body: HomePage()
      ),
    );
  }
}
