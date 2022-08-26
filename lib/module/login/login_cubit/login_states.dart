abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginAndSignUpSwap extends LoginStates{}

class RememberMeChangeState extends LoginStates{}

class LoginWithEmailAndPasswordLoadingState extends LoginStates{}

class LoginWithEmailAndPasswordSuccessState extends LoginStates{}

class LoginWithEmailAndPasswordErrorState extends LoginStates{
  dynamic error;
  LoginWithEmailAndPasswordErrorState({required this.error});
}

class LoginWithGoogleAccountLoadingState extends LoginStates{}

class LoginWithGoogleAccountSuccessState extends LoginStates{}

class LoginWithGoogleAccountErrorState extends LoginStates{
  dynamic error;
  LoginWithGoogleAccountErrorState({required this.error});
}

class CreateUserWithEmailAndPasswordLoadingState extends LoginStates{}

class CreateUserWithEmailAndPasswordSuccessState extends LoginStates{}

class CreateUserWithEmailAndPasswordErrorState extends LoginStates{
  dynamic error;
  CreateUserWithEmailAndPasswordErrorState({required this.error});
}

class SendOTPCodeLoadingState extends LoginStates{}

class SendOTPCodeSuccessState extends LoginStates{}

class SendOTPCodeErrorState extends LoginStates{
  dynamic error;
  SendOTPCodeErrorState({required this.error});
}

class VerifyOTPCodeLoadingState extends LoginStates{}

class VerifyOTPCodeSuccessState extends LoginStates{}

class VerifyOTPCodeErrorState extends LoginStates{
  dynamic error;
  VerifyOTPCodeErrorState({required this.error});
}