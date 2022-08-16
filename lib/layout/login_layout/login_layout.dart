import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavei/module/login/login_screen.dart';
import 'package:lavei/module/sign_up/sign_up_screen.dart';
import 'package:lavei/shared/style/colors.dart';

class LoginLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
//          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 180.0,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: AssetImage('assets/images/img_1.png'),
                    height: 160.0,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Text(
                          'La  Vie',
                          style: GoogleFonts.meddon(
                            textStyle: TextStyle(fontSize: 27.0,color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(top: 14.0),
                          child: SizedBox(
                            width: 23.0,
                            height: 15.04,
                            child: Image(image: AssetImage('assets/images/img.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  DefaultTabController(
                    length: 2,
                    initialIndex: 1,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                        labelColor: defaultColor,
                        labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.0,)),
                        onTap: (index){

                        },
                        tabs: const[
                          Tab(text: 'Sign Up',),
                          Tab( text: 'Login',),
                        ]
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: LoginScreen(),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 160.0,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children:const [
                  Image(
                    image: AssetImage('assets/images/img_2.png'),
                    width: 160.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
