import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';

import '../../shared/component/components.dart';
import '../login/login_cubit/login_cubit.dart';

class ConfirmOTPCodeScreen extends StatefulWidget {
  String email;

  ConfirmOTPCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ConfirmOTPCodeScreen> createState() => _ConfirmOTPCodeScreenState();
}

class _ConfirmOTPCodeScreenState extends State<ConfirmOTPCodeScreen> {
  var formKey=GlobalKey<FormState>();

  var otpCodeController=TextEditingController();

  var lengthOfCode=0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state){
        if(state is VerifyOTPCodeSuccessState){
          //navigate to new password screen
        }
        if(state is VerifyOTPCodeErrorState){
          if(state.error is DioError){
            showToast(messege: state.error.response!.data['message'], state: ToastStates.ERROR);
          }
        }
      },
        builder: (context,state){
          return Scaffold(
            body: Column(
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
                SingleChildScrollView(
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
                                'OTP code',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: HexColor('#6F6F6F'),fontSize: 14.0),
                                ),
                              ),
                              const SizedBox(height: 2.0,),
                              defaultTextFormField(
                                maxLength: 6,
                                height: 70.0,
                                controler: otpCodeController,
                                input: TextInputType.number,
                                validate: (value){
                                  if(value!.isEmpty){
                                    return 'Enter OTP code send to your email';
                                  }
                                },
                                onChange: (value){
                                  setState((){
                                    lengthOfCode = value.length;
                                  });
                                },
                                lable: '',
                                onSubmitted: (value){
                                  if(formKey.currentState!.validate()){}
                                },
                              ),
                              mySpace(),
                              if(lengthOfCode==6)
                                ConditionalBuilder(
                                  condition: state is! VerifyOTPCodeLoadingState,
                                  builder: (context)=>defaultButton(
                                      function: (){
                                        if(formKey.currentState!.validate()){
                                          LoginCubit.get(context).verifyOTPMessage(code: otpCodeController.text, email: widget.email);
                                        }
                                      },
                                      text: 'Confirm'
                                  ),
                                  fallback:(context)=> Center(child: CircularProgressIndicator(),)),

                            ],
                          ),
                        ),
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
                      width: 155.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
