import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/module/confirm_otp/confirm_otp_screen.dart';
import '../../shared/component/components.dart';
import '../login/login_cubit/login_cubit.dart';
import '../login/login_cubit/login_states.dart';

class ForgetPasswordScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state){
        if (state is SendOTPCodeErrorState){
          if(state.error is DioError){
            showToast(messege: state.error.response!.data['message'], state: ToastStates.ERROR);
          }
        }
        if(state is SendOTPCodeSuccessState){
          navigateTo(context, ConfirmOTPCodeScreen(email: emailController.text,));
        }
      },
      builder: (context, state){
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:120.0),
                  child: Center(
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
                        const SizedBox(height: 15.0,),
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
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
                                          onSubmitted: (value){
                                            if(formKey.currentState!.validate()){

                                            }
                                          },
                                        ),
                                        mySpace(),

                                        ConditionalBuilder(
                                            condition: state is! SendOTPCodeLoadingState,
                                            builder: (context)=>defaultButton(
                                                function: (){
                                                  if(formKey.currentState!.validate()){
                                                    LoginCubit.get(context).sendOTPToEmail(emailController.text);
                                                  }
                                                },
                                                text: 'Forget Password'
                                            ),
                                            fallback:(context)=> Center(child: CircularProgressIndicator(),)),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160.0,
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
                    Spacer(),
                    const SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image(
                          image: AssetImage('assets/images/img_2.png'),
                          width: 160.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
