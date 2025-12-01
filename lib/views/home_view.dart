import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue[500],
          title: Text(
            'Weather',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
              ),),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext){
                      return SearchView();
                }));
              }, icon: Icon(Icons.search,size: 30,fontWeight: FontWeight.bold))
            ],
        ),
        body: BlocBuilder< GetWeatherCubit, WeatherStates>(
          builder: (context , state){
            if(state is WeatherInitial){
              return NoWeather();
            }
            else if (state is WeatherSccess){
              return WeatherInfoBody();
            }
            else if (state is WeatherLoding){
              return Center(
                child: CircularProgressIndicator());
            }
            else { 
             return Center(child: Text("opps ther was an error"));
            }
          }
          )
      );
  }
}