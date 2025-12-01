import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherInitial extends WeatherStates {} //noWeather

class WeatherSccess extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherSccess({required this.weatherModel});//Consturactr 
}

class WeatherLoding extends WeatherStates {}

class WeatherFailure extends WeatherStates {}
