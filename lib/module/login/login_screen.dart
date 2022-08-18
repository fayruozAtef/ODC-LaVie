import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/module/login/login_cubit/login_cubit.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';
import 'package:lavei/shared/component/components.dart';

class LoginScreen extends StatelessWidget {

  var formKey= GlobalKey<FormState>();
  var emailController= TextEditingController();
  var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state){},
      builder: (context,state)=>Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      isPassword: true,
                      validate: (value){
                        if(value!.isEmpty){
                          return 'Enter your password';
                        }
                      },
                      onSubmitted: (value){
                        if(formKey.currentState!.validate()){
                          LoginCubit.get(context).loginWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        }
                      },
                      lable: '',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        TextButton(
                            onPressed: (){
                              LoginCubit.get(context).changeRememberMeState();
                            },
                            child: Row(
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Checkbox(
                                          value: LoginCubit.get(context).rememberMe,
                                          onChanged: (value){

                                          }
                                      )
                                  ),
                                  // You can play with the width to adjust your
                                  // desired spacing
                                  SizedBox(width: 3.0),
                                  Text(
                                    "Remember me",
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 13.0,
                                            height: 1.0,
                                            color: HexColor('#939393'))),
                                  ),
                                ]
                            ),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (){
                            },
                            child: Text(
                                'Forget Password?',
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14.0, height: 1.0 )),
                            )),
                      ],
                    ),
                    mySpace(),
                    ConditionalBuilder(
                        condition: state is! LoginWithEmailAndPasswordLoadingState,
                        builder: (context)=>defaultButton(
                            function: (){
                              if(formKey.currentState!.validate()){
                                LoginCubit.get(context).loginWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                              }
                            },
                            text: 'Login'
                        ),
                        fallback:(context)=> Center(child: CircularProgressIndicator(),)),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
