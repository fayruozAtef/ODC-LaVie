abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginAndSignUpSwap extends LoginStates{}

class LoginWithEmailAndPasswordLoadingState extends LoginStates{}

class LoginWithEmailAndPasswordSuccessState extends LoginStates{}

class LoginWithEmailAndPasswordErrorState extends LoginStates{
  String errorText;
  LoginWithEmailAndPasswordErrorState({required this.errorText});
}