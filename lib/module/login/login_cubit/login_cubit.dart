import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lavei/module/login/login_cubit/login_states.dart';
import 'package:lavei/module/login/login_screen.dart';
import 'package:lavei/module/sign_up/sign_up_screen.dart';
import 'package:lavei/shared/component/constants.dart';
import 'package:lavei/shared/network/local/cach_helper.dart';
import 'package:lavei/shared/network/remote/dio_helper.dart';
import 'package:lavei/shared/network/remote/end_points.dart';

import '../../../model/user_model/login_model.dart';


class LoginCubit extends Cubit<LoginStates>{

  LoginModel? loginModel;

  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  int currentIndex=1;
  bool rememberMe=false;
  List<Widget> screens=[
    SignUpScreen(),
    LoginScreen(),
  ];

  void swapLoginAndSignUp(int index){
    currentIndex=index;
    emit(LoginAndSignUpSwap());
  }

  void changeRememberMeState(){
    rememberMe=!rememberMe;
    emit(RememberMeChangeState());
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
          CURRENT_TOKEN=loginModel!.data!.accessToken!;
          REFRECH_TOKEN=loginModel!.data!.refreshToken!;
          if(rememberMe) {
            CashHelper.saveData(key: SharedKeys.CURRENT_API, value: loginModel!.data!.accessToken!);
          }
      emit(LoginWithEmailAndPasswordSuccessState());
        })
        .catchError((error){
          print("error login --> "+error.toString());
          emit(LoginWithEmailAndPasswordErrorState(error: error));

    });
  }

  void loginWithGoogleAccount() async{
    emit(LoginWithGoogleAccountLoadingState());
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print('Access Token --> '+googleAuth!.accessToken!);
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
        .then((value) {
          loginModel = LoginModel.fromJson(value.data);
          CURRENT_TOKEN = loginModel!.data!.accessToken!;
          REFRECH_TOKEN = loginModel!.data!.refreshToken!;
          emit(CreateUserWithEmailAndPasswordSuccessState());
        }).
    catchError((error) {
      print("error login --> " + error.toString());
      if(error is DioError){

      }
      emit(CreateUserWithEmailAndPasswordErrorState(error: error));
    });
  }

  void sendOTPToEmail(String email){
    emit(SendOTPCodeLoadingState());
    DioHelper.postData(url: SEND_OTP_CODE, data: {'email': email})
        .then((value) {
          print('OTP send successfully');
          emit(SendOTPCodeSuccessState());
        })
        .catchError((onError) {
          if(onError is DioError)
            print('Error send OTP '+onError.response!.data['message']);
          emit(SendOTPCodeErrorState(error: onError));
        });
  }

  void verifyOTPMessage({required String code, required String email}){
    emit(VerifyOTPCodeLoadingState());
    DioHelper.postData(
            url: VERIFY_OTP_CODE, data: {'email': email, 'otp': code})
        .then((value) {
          emit(VerifyOTPCodeSuccessState());
        })
        .catchError((error) {
          emit(VerifyOTPCodeErrorState(error: error));
        });
  }

  void resetPassword({required String otpCode, required String email,required String password}){
    emit(ResetPasswordLoadingState());
    DioHelper.postData(
        url: RESET_PASSWORD,
        data: {'email': email, 'otp': otpCode, 'password': password})
        .then((value) {
          emit(ResetPasswordSuccessState());
        })
        .catchError((error) {
          emit(ResetPasswordErrorState(error: error));
        });
  }
}