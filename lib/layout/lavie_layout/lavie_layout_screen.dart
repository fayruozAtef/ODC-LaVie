import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavei/layout/lavie_layout/cubit/cubit.dart';

import '../../shared/style/colors.dart';
import 'cubit/states.dart';

class LavieLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size ;
    return BlocProvider(
        create: (BuildContext context)=>LaVieCubit(),
      child: BlocConsumer<LaVieCubit,LaVieStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
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

                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 72.0,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: size.width,
                      height: 70,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 70),
                            painter: BNBCustomPainter(context:  context),
                          ),
                          Center(
                            heightFactor: 0.8,
                            child: FloatingActionButton(
                                backgroundColor: defaultColor,
                                child: Icon(Icons.home_outlined,size: 30.0,),
                                elevation: 0.1,
                                onPressed: () {

                                }),
                          ),
                          Container(
                            width: size.width,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.energy_savings_leaf_outlined,
                                    size: 30.0,
                                    color: LaVieCubit.get(context).currentBottomNavBarIndex == 0 ? defaultColor : Colors.grey.shade400,
                                  ),
                                  onPressed: () {
                                    LaVieCubit.get(context).changeBottomNav(0);
                                  },
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.qr_code_scanner_outlined,
                                      size: 30.0,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 1 ? defaultColor : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      LaVieCubit.get(context).changeBottomNav(1);
                                    }),
                                Container(
                                  width: size.width * 0.20,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.notifications_outlined,
                                      size: 30.0,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 2 ? defaultColor : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      LaVieCubit.get(context).changeBottomNav(2);
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.person_outline,
                                      size: 30.0,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 3 ? defaultColor : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      LaVieCubit.get(context).changeBottomNav(3);
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  BuildContext context;
  BNBCustomPainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 15);
    path.arcToPoint(Offset(size.width * 0.60, 25), radius: Radius.circular(25.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
