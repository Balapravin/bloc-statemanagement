import 'package:bloc_poc/bloc/home_page/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Bloc Test', () {

    blocTest(
      "Home Bloc Success State",
      build: () => HomeBloc(),
      setUp: () {
         HomeBloc().state.props;
      },
      act: (bloc) => bloc.add(HomeInitialEvent()),
      wait: const Duration(seconds: 2),
      expect: () => [
        HomeLoadingState(),
        HomeLoadingSuccessState(const []),
      ],
    );
  });
}

