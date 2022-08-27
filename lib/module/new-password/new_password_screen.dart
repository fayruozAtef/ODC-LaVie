import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/layout/login_layout/login_layout.dart';
import 'package:lavei/module/login/login_cubit/login_cubit.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';

import '../../shared/component/components.dart';

class NewPasswordScreen extends StatelessWidget {

  String email;
  String otpCode;
  NewPasswordScreen({Key? key,required this.email,required this.otpCode}) : super(key: key);

  var formKey=GlobalKey<FormState>();
  var newPasswordController=TextEditingController();
  var confirmNewPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state){
          if(state is ResetPasswordSuccessState){
            navigateAndDelete(context, LoginLayout());
          }
          if(state is ResetPasswordErrorState){
            if(state.error is DioError){
              showToast(messege: state.error.response!.data['message'], state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state)=>Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children:const [
                      Image(
                        image: AssetImage('assets/images/img_1.png'),
                        height: 155.0,
                      ),
                    ],
                  ),
                ),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mySpace(),
                          Text(
                            'New Password',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                            ),
                          ),
                          const SizedBox(height: 2.0,),
                          defaultTextFormField(
                            height: 70.0,
                            controler: newPasswordController,
                            input: TextInputType.text,
                            isPassword: true,
                            validate: (value){
                              if(value!.isEmpty){
                                return 'Enter a new password';
                              }
                              return null;
                            },
                            lable: '',
                          ),
                          mySpace(),
                          Text(
                            'Confirm New Password',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                            ),
                          ),
                          const SizedBox(height: 2.0,),
                          defaultTextFormField(
                            height: 70.0,
                            controler: confirmNewPasswordController,
                            input: TextInputType.text,
                            isPassword: true,
                            validate: (value){
                              if(value!.isEmpty){
                                return 'Confirm your password';
                              }
                              else if(value!=newPasswordController.text){
                                return 'Doesn\'t match';
                              }
                              return null;
                            },
                            lable: '',
                            onSubmitted: (value){
                              if(formKey.currentState!.validate()){}
                            },
                          ),
                          mySpace(),
                          ConditionalBuilder(
                              condition: state is! ResetPasswordLoadingState,
                              builder: (context)=>defaultButton(
                                  function: (){
                                    if(formKey.currentState!.validate()){
                                      LoginCubit.get(context).resetPassword(otpCode: otpCode, email: email, password: newPasswordController.text);
                                    }
                                  },
                                  text: 'Save'
                              ),
                              fallback:(context)=> Center(child: CircularProgressIndicator(),)),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(
                      image: AssetImage('assets/images/img_2.png'),
                      width: 155.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
