import 'package:flutter/material.dart';
import 'package:weather/view/login_page.dart';
import 'package:weather/view/splash.dart';
import 'package:weather/view/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.green, backgroundColor: Colors.black),
      home: WeatherPage(),
    );
  }
}
