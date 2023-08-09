part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginState {}

class PasswordVisibilityState extends LoginState {}
