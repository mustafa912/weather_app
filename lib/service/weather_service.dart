import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  
  Dio dio = Dio();
  final String baseUrl ='https://api.weatherapi.com/v1';
  final String apiKey= 'fc780718000845139dd164108252811';

  Future<WeatherModel> getCurrentWeather({required String city}) async{
 try{
  Response response =await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
  WeatherModel weatherModel =WeatherModel.fromJson(response.data);
  return weatherModel;
 }
 on DioException catch(e){
  final message = e.response?.data['error']['message']??'oops there was an Error';
  throw Exception(message);
 }
 catch (e){
  log(e.toString());  
  throw Exception('opps there was an error, try later ');
 }
  }
}