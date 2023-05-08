import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/view/login_page.dart';
import 'weather_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkToken();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset('assets/lottie/58713-weather-icon.json'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToGetPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!Get.isDialogOpen!) {
      Get.off(() => LoginPage());
    }
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user');
    if (token == null) {
      goToGetPage();
    } else {
      await Future.delayed(const Duration(seconds: 8));
      if (!Get.isDialogOpen!) {
        Get.off(() => WeatherPage());
      }
    }
  }
}
