import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/weather_provider.dart';
import 'package:weather_app/SearchPage.dart';
import 'package:weather_app/services/Models.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // print('this is weather::: ${Provider.of<WeatherProvider>(context).getWeatherModel}');
    WeatherModel weatherModel = Provider.of<WeatherProvider>(context).getWeatherModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              })
        ],
      ),
      body: (weatherModel != null)
          ? Container(
              padding: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                       weatherModel.getbackGroundColor()[700],
                        weatherModel.getbackGroundColor()[500],
                        weatherModel.getbackGroundColor()[300],
                      ])),
              child: Container(
                width: double.infinity,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text(
                          weatherModel.cityName,
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                        SizedBox(height: 15,),
                        Text( 'Updated ${weatherModel.dataTime.format(context)}'
                          ,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                         backgroundImage: AssetImage(weatherModel.getImage()),
                         // backgroundImage: AssetImage(''),
                        ),
                        Text(
                          weatherModel.theTemp.floor().toString() ,
                          style: TextStyle(fontSize: 40),
                        ),
                        Column(
                          children: [
                            Text('Max: ${weatherModel.maxTemp.floor()}°', style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 0.5),),
                            Text('Min: ${weatherModel.minTemp.floor()}°', style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 0.5)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                        child: Text(
                      weatherModel.weatherStateName,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather🙂,search now? ',
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
    );
  }
}