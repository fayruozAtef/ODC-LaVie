import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavei/layout/lavie_layout/cubit/cubit.dart';
import 'package:lavei/shared/component/components.dart';
import 'package:lavei/shared/component/constants.dart';
import '../../shared/style/colors.dart';
import 'cubit/states.dart';

class LavieLayoutScreen extends StatelessWidget {

  var searchController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              enableSuggestions: true,
                              controller: searchController,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value){},
                              style: GoogleFonts.roboto(textStyle:TextStyle(height: 1.0, color: textColor)),
                              decoration:  InputDecoration(
                                labelText: 'Search',
                                labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color:textColor,fontSize: 16.0)),
                                errorStyle: TextStyle(height: 0.3),
                                prefixIcon: Icon(Icons.search_outlined),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        Container(
                          height: 58.0,
                          width: 51.0,
                          decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print('Current Token --->'+CURRENT_TOKEN!);
                              LaVieCubit.get(context).getAllProducts();
                            },
                            icon: const Image(
                              image: AssetImage(
                                'assets/images/cart.png',
                              ),
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: categoryItem('All',(){}),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:const  EdgeInsets.only(right: 5.0),
                              child: categoryItem('Plants',(){}),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: categoryItem('Seeds',(){}),
                            ),
                          ),
                          Expanded(child: categoryItem('Tools',(){})),

                        ],
                    ),
                    const SizedBox(height: 20.0,),
                    GridView.count(
                        crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 3.0,
                      children: List.generate(6, (index) => productItem()),
                    ),
                  ],
                ),
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
                      color: Colors.transparent,
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
                                backgroundColor: lightGreen,
                                child: new Image(
                                  image: AssetImage('assets/images/home.png'),
                                  height: 25,
                                  width: 25,
                                ),
                                elevation: 0.1,
                                onPressed: () {
                                  LaVieCubit.get(context).changeBottomNav(-1);
                                }),
                          ),
                          Container(
                            width: size.width,
                            color: Colors.transparent,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Image(
                                    image: AssetImage('assets/images/leaf.png'),
                                    height: 25,
                                    width: 25,
                                    color: LaVieCubit.get(context).currentBottomNavBarIndex == 0 ? lightGreen : Colors.grey.shade400,
                                  ),
                                  onPressed: () {
                                    LaVieCubit.get(context).changeBottomNav(0);
                                  },
                                ),
                                IconButton(
                                    icon: Image(
                                      image: AssetImage('assets/images/qr-code-scan.png'),
                                      height: 25,
                                      width: 25,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 1 ? lightGreen : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      LaVieCubit.get(context).changeBottomNav(1);
                                    }),
                                Container(
                                  color: Colors.transparent,
                                  width: size.width * 0.20,
                                ),
                                IconButton(
                                    icon: Image(
                                      image: AssetImage('assets/images/bell.png'),
                                      height: 25,
                                      width: 25,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 2 ? lightGreen : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      LaVieCubit.get(context).changeBottomNav(2);
                                    }),
                                IconButton(
                                    icon: Image(
                                      image: AssetImage('assets/images/user.png'),
                                      height: 25,
                                      width: 25,
                                      color:LaVieCubit.get(context).currentBottomNavBarIndex == 3 ? lightGreen : Colors.grey.shade400,
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

Widget categoryItem(String title, VoidCallback onPressed){
  return Container(
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          '$title',
          style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 16.0),color: lightGreen),
        ),
      ));
}

