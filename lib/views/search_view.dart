import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var get_weather_cubit= BlocProvider.of<GetWeatherCubit>(context).getWeather(CityName: value);
              Navigator.pop(context);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              suffixIcon: Icon(Icons.search,size: 30,),
              hintText: "Enter your City",
              labelText: 'Search',
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              )
            ),
          ),
        ),
      ),
    );
  }
}