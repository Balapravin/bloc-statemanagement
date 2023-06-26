part of 'login_page_bloc.dart';

abstract class LoginPageEvent {}

class LoginButtonClickEvent extends LoginPageEvent{
  final String email;
  final String password;

  LoginButtonClickEvent(this.email, this.password);

}

class LoginRetryEvent extends LoginPageEvent{}

