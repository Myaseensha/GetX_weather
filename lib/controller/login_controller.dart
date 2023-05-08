import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:weather/view/weather_screen.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  handleLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(WeatherPage());
    });
  }

  handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        usernameController.text = googleUser.email;
      }
    } catch (error) {
      print('Google sign-in error: $error');
      // Handle sign-in errors here
    }
  }
}
