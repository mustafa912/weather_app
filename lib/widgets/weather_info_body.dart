import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {

  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherData = 
              BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          getWeatherConditionColor(weatherData.stateOfweater),
          getWeatherConditionColor(weatherData.stateOfweater)[300]!,
          getWeatherConditionColor(weatherData.stateOfweater)[50]!,
        ] ,
        begin: AlignmentGeometry.topCenter,
        end: AlignmentGeometry.bottomCenter
           
        )
      ),
      child: Center(
        child: Column(
          children: [
            Spacer(flex: 1,),
            Text(weatherData.CityName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
      
            Text("Last Updated ${weatherData.updatedTime.hour}:${weatherData.updatedTime.hour}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.normal
            ),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Image.network(weatherData.icon == null
        ? "https://cdn.weatherapi.com/weather/64x64/day/113.png"
        : (weatherData.icon!.startsWith("https:")
            ? weatherData.icon!
            : "https:${weatherData.icon}")),
                  Spacer(flex: 1,),
                  Text(weatherData.temp.round().toString(),style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),),
                  Spacer(flex: 1,),
                  Column(
                    children: [
                      Text('MaxTemp: ${weatherData.maxTemp.round()}',style: TextStyle(fontSize: 20),),
                      Text('MinTemp: ${weatherData.minTemp.round()}',style: TextStyle(fontSize: 20),)
                    ],
                  )
              
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(weatherData.stateOfweater,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
      
           , Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}