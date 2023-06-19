part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginButtonSuccessState extends LoginState {}

class LoginButtonFaildState extends LoginState {}