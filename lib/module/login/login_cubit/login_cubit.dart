import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';
import 'package:lavei/module/login/login_screen.dart';
import 'package:lavei/module/sign_up/sign_up_screen.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  int currentIndex=1;
  List<Widget> screens=[
    SignUpScreen(),
    LoginScreen(),
  ];

  void swapLoginAndSignUp(int index){
    currentIndex=index;
    emit(LoginAndSignUpSwap());
  }


}