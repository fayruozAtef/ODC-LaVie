import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lavei/layout/lavie_layout/lavie_layout_screen.dart';

import 'module/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: SplashScreen(),
        nextScreen: LavieLayoutScreen(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
