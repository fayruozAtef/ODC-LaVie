import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: [
            Text(
                'La  Vie',
              style: GoogleFonts.meddon(
                textStyle: TextStyle(fontSize: 36.0,color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(top: 25.0),
              child: SizedBox(
                width: 29.0,
                height: 19.0,
                child: Image(image: AssetImage('assets/images/img.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
