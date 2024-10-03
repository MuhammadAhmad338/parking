import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking/Helper/const.dart';
import 'package:parking/Screens/PinEntryScreen/View/pinEntryScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Checking the authentication state after a slight delay to simulate a splash screen effect
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const PinEntryScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          Const.parking,
          scale: 3,
        ),
      ),
    );
  }
}
