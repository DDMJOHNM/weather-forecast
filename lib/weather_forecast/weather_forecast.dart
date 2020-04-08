import 'package:flutter/material.dart';
import 'package:weatherforecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/weather_forecast/network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
 Future<WeatherForecastModel> forecastObject;
 String _cityName="Mumbai";
  @override
  void initState(){
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    forecastObject.then((weather)=>{
       print(weather.city)
    });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text("Forecast"),
      ),
    );
  }
}
