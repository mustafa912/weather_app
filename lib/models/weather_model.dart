
class WeatherModel {
  final String CityName;
  final DateTime updatedTime;
  final String? icon;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String stateOfweater;

  const WeatherModel({
     required this.CityName,
     required this.updatedTime,
     this.icon,
     required this.temp,
     required this.maxTemp,
     required this.minTemp,
     required this.stateOfweater});
 
 factory WeatherModel.fromJson(json){
  return WeatherModel(
    CityName: json['location']['name'], 
    updatedTime: DateTime.parse(json['current']['last_updated']), 
    temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'], 
    maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'], 
    minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'], 
    icon: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    stateOfweater: json['forecast']['forecastday'][0]['day']['condition']['text']);
    
 }
   
}