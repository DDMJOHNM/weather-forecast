import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/weather_forecast/util/convert_icon.dart';
import 'package:weatherforecast/weather_forecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastlist = snapshot.data.list;
  var weatherlist = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastlist[0].dt*1000);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Text("$city,$country ", style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color:Colors.black87,
         )),
         Text("${Util.getFormmatedDate(formattedDate)}",style:TextStyle(
             fontSize: 15
         ),),
         SizedBox(height:10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child:getWeatherIcon(weatherDescription: forecastlist[0].weather[0].main,color:Colors.purpleAccent,size:100,)

           ),
           Padding(
             padding:const EdgeInsets.all(12.0),
             child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forecastlist[0].main.temp.toStringAsFixed(0)} ${"\u2109"} ",style: TextStyle(fontSize: 25,),),
                Text("${weatherlist[0].weather[0].main}"),
              ],
             ),
           ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: <Widget>[
                     Text("${forecastlist[0].wind.speed.toStringAsFixed(1)} mi/h"),
                     Icon(FontAwesomeIcons.galacticRepublic, size:20,color:Colors.amber),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: <Widget>[
                     Text("${forecastlist[0].main.humidity.toStringAsFixed(1)}%"),
                     Icon(Icons.wb_sunny, size:20,color:Colors.amber),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: <Widget>[
                     Text("${forecastlist[0].main.tempMax.toStringAsFixed(1)} ${"\u2109"} "),
                     Icon(FontAwesomeIcons.thermometerEmpty, size:20,color:Colors.amber),
                   ],
                 ),
               ),
             ],
           ),
         ),

       ],
     ),
    ),
  );
  return midView;
}

