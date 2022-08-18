abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginAndSignUpSwap extends LoginStates{}

class RememberMeChangeState extends LoginStates{}

class LoginWithEmailAndPasswordLoadingState extends LoginStates{}

class LoginWithEmailAndPasswordSuccessState extends LoginStates{}

class LoginWithEmailAndPasswordErrorState extends LoginStates{
  String errorText;
  LoginWithEmailAndPasswordErrorState({required this.errorText});
}

class CreateUserWithEmailAndPasswordLoadingState extends LoginStates{}

class CreateUserWithEmailAndPasswordSuccessState extends LoginStates{}

class CreateUserWithEmailAndPasswordErrorState extends LoginStates{
  String errorText;
  CreateUserWithEmailAndPasswordErrorState({required this.errorText});
}

class ForgetPasswordLoadingState extends LoginStates{}

class ForgetPasswordSuccessState extends LoginStates{}

class ForgetPasswordErrorState extends LoginStates{}