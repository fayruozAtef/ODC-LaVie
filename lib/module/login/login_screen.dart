import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/shared/component/components.dart';

class LoginScreen extends StatelessWidget {

  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mySpace(),
                 Text(
                    'Email',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 2.0,),
                defaultTextFormField(
                    controler: emailController,
                    input: TextInputType.emailAddress,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Enter your email';
                      }
                    },
                    lable: '',
                ),
                mySpace(),
                Text(
                  'Password',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 2.0,),
                defaultTextFormField(
                  controler: passwordController,
                  input: TextInputType.text,
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Enter your password';
                    }
                  },
                  lable: '',
                ),
                mySpace(),
                defaultButton(function: (){}, text: 'Login'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
