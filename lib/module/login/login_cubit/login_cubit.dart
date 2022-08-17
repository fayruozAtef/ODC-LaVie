import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';
import 'package:lavei/module/login/login_screen.dart';
import 'package:lavei/module/sign_up/sign_up_screen.dart';
import 'package:lavei/shared/component/components.dart';
import 'package:lavei/shared/network/local/cach_helper.dart';
import 'package:lavei/shared/network/remote/dio_helper.dart';
import 'package:lavei/shared/network/remote/end_points.dart';

import '../../../model/login_models/Login_Model.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginModel? loginModel;

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

  void loginWithEmailAndPassword({required String email, required String password}){
    emit(LoginWithEmailAndPasswordLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        }
        )
        .then((value){
          loginModel=LoginModel.fromJson(value.data);
          CashHelper.saveData(key: 'TOKEN', value: loginModel!.data!.accessToken!);
          emit(LoginWithEmailAndPasswordSuccessState());
        })
        .catchError((error){
          print("error login --> "+error.toString());
          emit(LoginWithEmailAndPasswordErrorState(errorText: error.toString()));
        });
  }

  void createUserWithEmailAndPassword({required String email, required String password,required String firstName, required String lastName}){
    emit(CreateUserWithEmailAndPasswordLoadingState());
    DioHelper.postData(
        url: SIGNUP,
        data: {
          'email':email,
          'password':password,
          'firstName':firstName,
          'lastName':lastName,
        }
    )
        .then((value){
      loginModel=LoginModel.fromJson(value.data);
      CashHelper.saveData(key: 'TOKEN', value: loginModel!.data!.accessToken!);
      emit(CreateUserWithEmailAndPasswordSuccessState());
    })
        .catchError((error){
      print("error login --> "+error.toString());
      emit(CreateUserWithEmailAndPasswordErrorState(errorText: error.toString()));
    });
  }
}