import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:weather/models/weather.dart';

import '../controller/getx.contrller.dart';

// ignore: must_be_immutable
class WeatherPage extends StatelessWidget {
  WeatherPage({
    super.key,
  });

  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SearchBar(controllers: controllers),
            Lottie.asset('assets/lottie/77045-good-weather.json'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GetX<WeatherController>(
                builder: (controller) {
                  var weathers = controller.weatherData.value;
                  if (weathers != null) {
                    return weather(weathers);
                  } else {
                    return const Text(
                      'Enter a location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////weaether display widget//////////////////////////////////////////////
Widget weather(Weather weather) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          "${weather.feel}🌡C",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 50,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          "${weather.name}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          "${weather.cloud}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          """Low:${weather.high}🌡C \n High:${weather.low}🌡C""",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}

//////////////////////////////////////search Bar////////////////////////////////
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  final TextEditingController controllers;

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());

    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: const Color.fromARGB(163, 205, 204, 204),
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
            controller: controllers,
            decoration: const InputDecoration(
              hintText: "Location",
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
            onEditingComplete: () {
              controller.getWeatherData(controllers.text);
            },
          ),
        ),
      ),
    );
  }
}
