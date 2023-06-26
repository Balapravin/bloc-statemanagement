import 'dart:async';

import 'package:bloc_poc/helper/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_service/api_service.dart';
part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<LoginButtonClickEvent>(loginButtonClickEvent);
    on<LoginRetryEvent>(loginRetryEvent);
  }

  Future loginButtonClickEvent(
      LoginButtonClickEvent event, Emitter<LoginPageState> emit) async{

    try{
      emit(LoginLoadingState());
      final data = await apiService.loginApi(event.email, event.password);
      if(data['token'] != null){
        /// mail id : eve.holt@reqres.in
        if(event.password == "abc@123"){
        emit(LoginSuccessState());
        emit(LoginPageInitial());
        }else{
          emit(LoginFailedState('Incorrect Password..!'));
          emit(LoginPageInitial());
        }
      }else{
        final errorMessage = data['error'];
        emit (LoginFailedState(errorMessage));
        emit(LoginPageInitial());
      }
    }catch(e){
      helper.logger('LoginButton Event-----------${e.toString()}');
      emit(LoginErrorState());
    }
  }

  FutureOr<void> loginRetryEvent(
      LoginRetryEvent event, Emitter<LoginPageState> emit) {
    emit(LoginPageInitial());
  }
}
