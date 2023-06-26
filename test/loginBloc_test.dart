import 'package:bloc_poc/bloc/login_page/login_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Login Bloc", () {
    blocTest(
      "Login bloc Success State",
      build: () => LoginPageBloc(),
      act: (bloc) =>
          bloc.add(LoginButtonClickEvent("eve.holt@reqres.in", "abc@123")),
      wait: const Duration(seconds: 2),
      expect: () =>
          [LoginLoadingState(), LoginSuccessState(), LoginPageInitial()],
    );

    blocTest(
      "Login bloc Failed State",
      build: () => LoginPageBloc(),
      act: (bloc) => bloc.add(LoginButtonClickEvent("email", "password")),
      wait: const Duration(seconds: 2),
      expect: () => [
        LoginLoadingState(),
        LoginFailedState('Incorrect Password..!'),
        LoginPageInitial()
      ],
    );
  });
}
