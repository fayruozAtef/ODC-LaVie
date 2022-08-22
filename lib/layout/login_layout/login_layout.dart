import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/layout/lavie_layout/lavie_layout_screen.dart';
import 'package:lavei/module/login/login_cubit/login_cubit.dart';
import 'package:lavei/shared/component/components.dart';
import 'package:lavei/shared/style/colors.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../module/login/login_cubit/login_states.dart';

class LoginLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state){
          if(state is LoginWithEmailAndPasswordSuccessState){
            showToast(messege: 'Login Successfully', state: ToastStates.SUCCESS);
            navigateAndDelete(context, LavieLayoutScreen());
          }
          if(state is LoginWithEmailAndPasswordErrorState){
            if(state.error is DioError) {
              showToast(
                  messege: '${state.error.response!.data['message']}',
                  state: ToastStates.ERROR);
            }
          }
          if(state is CreateUserWithEmailAndPasswordSuccessState){
            showToast(messege: 'Successfully create new account', state: ToastStates.SUCCESS);
            navigateAndDelete(context, LavieLayoutScreen());
          }
          if(state is CreateUserWithEmailAndPasswordErrorState){
            if(state.error is DioError) {
              if(state.error.response!.data['message'] is String) {
                showToast(
                    messege: '${state.error.response!.data['message']}',
                    state: ToastStates.ERROR);
              }
              else{
                showToast(
                    messege: '${state.error.response!.data['message'][state.error.response!.data['message'].length -1]}',
                    state: ToastStates.ERROR);
              }
            }
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
                          DefaultTabController(
                            length: 2,
                            initialIndex: LoginCubit.get(context).currentIndex,
                            child: TabBar(
                              indicator:  MaterialIndicator(
                                height: 2,
                                topLeftRadius: 0,
                                topRightRadius: 0,
                                bottomLeftRadius: 2,
                                bottomRightRadius: 2,
                                color: defaultColor,
                                horizontalPadding: 75.0,
                                tabPosition: TabPosition.bottom,
                              ),
                                unselectedLabelColor: Colors.grey,
                                labelColor: lightGreen,
                                labelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.0,)),
                                onTap: (index){
                                  LoginCubit.get(context).swapLoginAndSignUp(index);
                                },
                                tabs: const[
                                  Tab(text: 'Sign Up',),
                                  Tab( text: 'Login',),
                                ]
                            ),

                          ),
                          Expanded(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      child: LoginCubit.get(context).screens[LoginCubit.get(context).currentIndex],
                                    ),
                                    const SizedBox(height: 30.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 45),
                                      child: Row(
                                        children: [
                                          Expanded(child: Container(height: 1.0,color: HexColor('#979797'),)),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                                            child: Text('or continue with',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12.0,color: HexColor('#979797'))),),
                                          ),
                                          Expanded(child: Container(height: 1.0,color: HexColor('#979797'),)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Image(image: AssetImage('assets/images/google.png'),fit: BoxFit.fill,),
                                          iconSize: 25,
                                          onPressed: () {
                                            LoginCubit.get(context).loginWithGoogleAccount();
                                          },
                                        ),
                                        const SizedBox(width: 20.0,),
                                        IconButton(
                                          icon: Image(image: AssetImage('assets/images/facebook.png'),),
                                          iconSize: 25,
                                          onPressed: () {

                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
                      Container(
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
      ),
    );
  }
}
