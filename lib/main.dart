import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavei/shared/network/local/cach_helper.dart';
import 'package:lavei/shared/style/block_observer.dart';
import 'package:lavei/shared/style/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'layout/login_layout/login_layout.dart';
import 'module/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: defaultColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Jannah',
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          backwardsCompatibility: false,
          color: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[100],
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          elevation: 20.0,
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black

          ),
          subtitle2: TextStyle(
              fontSize: 30.0,
              fontWeight:FontWeight.bold ,
              color: Colors.black
          ),
          bodyText2:TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),


      ),
      home: AnimatedSplashScreen(
        duration: 5000,
        splash: SplashScreen(),
        nextScreen: LoginLayout(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
