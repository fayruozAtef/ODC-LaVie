import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

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

Widget productItem(){
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Image(
                image: NetworkImage(''),
                width: 210.0,
                height: 210.0,
                //fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end:8.0),
              child: Row(
                children: [
                  Container(
                    color: lightGrey,
                    width: 30.0,
                    height: 30.0,
                    child: MaterialButton(
                      onPressed: (){},
                      child: Text('-'),
                    ),
                  ),
                  Text('1'),
                  Container(
                    color: lightGrey,
                    width: 30.0,
                    height: 30.0,
                    child: MaterialButton(
                      height: 30.0,
                      minWidth: 10.0,
                      onPressed: (){},
                      child: Text('+'),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,)),
              ),
              Text(
                'Price:',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12.0,)),
              ),
              const SizedBox(height: 10.0,),
              defaultButton(function: (){}, text: 'Add to cart',height: 35.0),
            ],
          ),
        ),
      ],
    ),
  );
}

