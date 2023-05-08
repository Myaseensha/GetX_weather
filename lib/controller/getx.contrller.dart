import 'package:get/get.dart';
import 'package:weather/controller/weather_get.dart';
import '../models/weather.dart';

class WeatherController extends GetxController {
  var weatherData = Rx<Weather?>(null);

  void getWeatherData(String location) async {
    var weatherTemp = await getWeather(location, Get.context!);
    if (weatherTemp != null) {
      weatherData.value = weatherTemp;
    }
  }
}
