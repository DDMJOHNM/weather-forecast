import 'package:flutter/material.dart';
import 'package:weatherforecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/weather_forecast/util/convert_icon.dart';
import 'package:weatherforecast/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
    var forecastList = snapshot.data.list;
    var dayOfWeek="";
    var fullDate = Util.getFormmatedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt *1000));
    dayOfWeek = fullDate.split(",")[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Center(
         child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        )),
       Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           CircleAvatar(
             radius: 25,
             backgroundColor: Colors.white,
             child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,color:Colors.purpleAccent),
           ),
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children:<Widget>[
                Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Text("${forecastList[index].wind.speed} mph", style:TextStyle(
                   fontSize: 14,
                   color: Colors.black87,
                 ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Text("${forecastList[index].main.humidity} %", style:TextStyle(
                   fontSize: 14,
                   color: Colors.black87,
                 ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(2.0),
                 child: Text("${forecastList[index].main.tempMax} ${"\u2109"}", style:TextStyle(
                   fontSize: 14,
                   color: Colors.black87,
                 ),),
               )
              ],
            )
         ],
       ),
      ],
    );
}