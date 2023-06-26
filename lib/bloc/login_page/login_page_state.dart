part of 'login_page_bloc.dart';

abstract class LoginPageState extends Equatable{
 @override
 List<Object> get props => [];
}

class LoginPageInitial extends LoginPageState {}

class LoginLoadingState extends LoginPageState{}

class LoginSuccessState extends LoginPageState{}

class LoginFailedState extends LoginPageState{
 final String errorMessage;

  LoginFailedState(this.errorMessage);
}
class LoginErrorState extends LoginPageState{}

