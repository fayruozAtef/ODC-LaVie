import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/shared/component/constants.dart';
import 'package:lavei/shared/network/local/cach_helper.dart';
import 'package:lavei/shared/network/remote/dio_helper.dart';
import 'package:lavei/shared/style/block_observer.dart';
import 'package:lavei/shared/style/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'layout/lavie_layout/lavie_layout_screen.dart';
import 'layout/login_layout/login_layout.dart';
import 'module/login/login_cubit/login_cubit.dart';
import 'module/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CURRENT_TOKEN= CashHelper.getData(key: SharedKeys.CURRENT_API);
  Widget widget=LoginLayout();
  if(CURRENT_TOKEN!=null){
    //widget=LavieLayoutScreen();
  }
  runApp(MyApp(widget: widget,));

}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool kisweb;
    try{
      if(Platform.isAndroid||Platform.isIOS) {
        kisweb=false;
      } else {
        kisweb=true;
      }
    } catch(e){
      kisweb=true;
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context)=> LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: defaultColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
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
        home:(kisweb)? widget: AnimatedSplashScreen(
          duration: 5000,
          splash: SplashScreen(),
          nextScreen: widget,
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
        ),
      ),
    );
  }
}
