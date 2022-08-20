import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('assets/images/emptyCart.png',),height: 244.0,width: 250.0,),
          ),
          const SizedBox(height: 10.0,),
          Text('Your cart is empty', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 24.0)),),
        ],
      ),
    );
  }
}
