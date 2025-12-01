import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
  child: Text(
    "there is no weather start searching now", // النص أولًا
    //softWrap: true,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);
  }
}