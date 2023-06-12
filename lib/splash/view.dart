import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venice/on_boarding/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Get.to(const OnBoardingScreen()));
    var assetsImage = const AssetImage('assets/images/logo.png');
    var image = Image(image: assetsImage, height: 300);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: image,
        ),
      ),
    );
  }
}
