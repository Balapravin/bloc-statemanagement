


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/api_service/api_service,dart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonEvent>(loginButtonEvent);
  }

  Future loginButtonEvent(event, emit) async {
    final data =await ApiService().loginApi(event.email, event.password);
    if(data['token'] != null){
    emit(LoginButtonSuccessState());
  }else{
    emit (LoginButtonFaildState());
    }
  }
}
