import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit,WeatherStates>(
            builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getWeatherConditionColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel?.stateOfweater),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherConditionColor(String? condition) {
  if (condition == null) {
    return Colors.brown;
  }
  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Blowing snow":
    case "Blizzard":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
      return Colors.lightBlue;
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.indigo;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
