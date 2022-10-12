part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginSuccessModel loginResult;

  LoginSuccess({required this.loginResult});
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final GlobalFailure? failure;

  LoginFailure({this.failure});
}
