import 'package:flutter/material.dart';
import 'package:weatherforecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/weather_forecast/network/network.dart';
import 'package:weatherforecast/weather_forecast/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        midView(snapshot),
                      ],
                    );
                  } else {
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(cityName:_cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) => new Network().getWeatherForecast(cityName: _cityName);


}


