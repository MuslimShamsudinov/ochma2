import 'package:flutter/material.dart';
import 'package:ochma2/views/HomeView.dart';

void main (){
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData.dark(),
    home: HomeView(),
    );
  }
}
List<String> tyjuy6u = [

];