import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:task5/controller/splashcontroller.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final SplashController _splashController= Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/qr.json'),
      ),
    );
  }
}
