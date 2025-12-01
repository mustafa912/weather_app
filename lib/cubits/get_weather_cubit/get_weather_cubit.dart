import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit <WeatherStates>{
  GetWeatherCubit() : super(WeatherInitial()); 

  WeatherModel? weatherModel;

  Future getWeather ({required String CityName}) async{
    try {
   weatherModel =
            await WeatherService().getCurrentWeather(city: CityName);
   emit(WeatherSccess(weatherModel: weatherModel!));

} catch (e) {
    emit(WeatherFailure());
  } 

  }
}  