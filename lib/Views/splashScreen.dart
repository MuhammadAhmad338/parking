import 'package:flutter/material.dart';
import 'package:parking/Helper/const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
