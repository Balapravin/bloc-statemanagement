part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonEvent(this.email, this.password);
}
