import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/product_model/Data.dart';
import '../style/colors.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndDelete(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route)=>false,//To delete all the store routes
);

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? action,
})=>AppBar(
  titleSpacing: 5.0,
  title: Text(
    title ?? '',style: GoogleFonts.roboto(),
  ),
  actions: action,
);

Widget defaultTextFormField({
  required TextEditingController controler,
  required TextInputType input,
  bool isPassword=false,
  Function(String)? onSubmitted,
  Function(String)? onChange,
  required String?Function(String?) validate,
  required String lable,
  IconData? icon,
  double width=double.infinity,
  IconData? sufixIcon,
  VoidCallback? suffixWork,
})=>SizedBox(
  height: 50.0,
  child: TextFormField(
    controller: controler,
    keyboardType: input,
    obscureText: isPassword,
    onFieldSubmitted: onSubmitted,
    onChanged: onChange,
    validator: validate,
    style: GoogleFonts.roboto(textStyle:TextStyle(height: 1.0, color: Colors.black.withOpacity(.8))),
    decoration: InputDecoration(
      labelText: lable,
      errorStyle: TextStyle(height: 0.3),
      border: OutlineInputBorder(),
    ),
  ),
);

Widget defaultButton({
  required VoidCallback  function,
  double width=double.infinity,
  double height=50.0,
  double textSize=16.0,
  required String text,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: lightGreen,
    borderRadius: BorderRadius.circular(7.0),
  ),
  child: MaterialButton(
    onPressed: function,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white , fontSize: textSize,
          ),
        ),
      ],
    ),
  ),
);

Widget mySpace()=>const SizedBox(height: 20.0,);

Widget myDivider()=>Container(height: 1.0,color: HexColor('#E8EBF0'),);

enum ToastStates {SUCCESS, ERROR, WARNING}

void showToast({
  required String? messege,
  required ToastStates state,

})=>Fluttertoast.showToast(
    msg: "${messege}",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 8,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget productItem({
  required Data data,
  required VoidCallback decreaseFunction,
  required VoidCallback increaseFunction,
  required VoidCallback addToCartFunction,
  int count=1,
}){
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 325.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 260.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0, // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${data.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,)),
                            ),
                            Text(
                              '${data.price} EGP',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12.0,)),
                            ),
                            const SizedBox(height: 10.0,),
                            defaultButton(function: addToCartFunction, text: 'Add to cart',height: 35.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image(
                            image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${data.imageUrl}')  ,
                            width: 210.0,
                            height: 210.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end:8.0),
                          child: Row(
                            children: [
                              Container(
                                color: lightGrey,
                                width: 25.0,
                                height: 25.0,
                                child: IconButton(onPressed: decreaseFunction, icon: Image(image: AssetImage('assets/images/minus.png'),),),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text('$count',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,height: 0.8,)),),
                              ),
                              Container(
                                color: lightGrey,
                                width: 25.0,
                                height: 25.0,
                                child: IconButton(onPressed: increaseFunction, icon: Image(image: AssetImage('assets/images/plus.png'),),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

