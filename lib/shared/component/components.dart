import 'package:flutter/material.dart';

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
    title ?? '',
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
  IconData? sufixIcon,
  VoidCallback? suffixWork,
})=>SizedBox(
  height: 47.0,
  child: TextFormField(
    controller: controler,
    keyboardType: input,
    obscureText: isPassword,
    onFieldSubmitted: onSubmitted,
    onChanged: onChange,
    validator: validate,
    decoration: InputDecoration(
      labelText: lable,
      border: OutlineInputBorder(),
    ),
  ),
);

Widget defaultButton({
  required VoidCallback  function,
  double width=double.infinity,
  double height=46.0,
  double textSize=16.0,
  Color color=defaultColor,
  required String text,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: color,
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

Widget mySpace()=>const SizedBox(height: 25.0,);

Widget myLine()=>Container(height: 2.0,color: Colors.grey[300],);