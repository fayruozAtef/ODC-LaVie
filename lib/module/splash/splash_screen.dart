import 'package:flutter/material.dart';
import 'package:lavei/shared/component/components.dart';

import '../../layout/lavie_layout/lavie_layout_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  navigateToStart() async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    navigateAndDelete(context,LavieLayoutScreen() );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: const [
            Text(
                'La \t Vie',
              style: TextStyle(fontSize: 36.0,height: 15,fontFamily: 'Meddon',color: Colors.black),
            ),
            SizedBox(
              width: 25.0,
              height: 25.0,
              child: Image(image: AssetImage('assets/images/img.png')),
            ),
          ],
        ),
      ),
    );
  }
}
