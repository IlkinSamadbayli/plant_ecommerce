part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SendLoginEvent extends LoginEvent {
  final String email;
  final String password;

  SendLoginEvent({
    required this.email,
    required this.password,
  });
}

class SendRegisterEvent {
  final String email;
  final String password;
  final int age;
  final String gender;
  final int number;

  SendRegisterEvent({
    required this.email,
    required this.password,
    required this.age,
    required this.gender,
    required this.number,
  });
}
