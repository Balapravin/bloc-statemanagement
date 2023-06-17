part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoaderState extends HomeState {}

class HomeLoaderSuccessState extends HomeState {
  final List<HomeProduct> product;
  HomeLoaderSuccessState({required this.product});
}

class HomeErrorState extends HomeState {
  final String errorMessage ;

  HomeErrorState({required this.errorMessage});}


class HomeWishListButtonNaviagtionActionState extends HomeActionState {}

class HomeCartButtonNaviagtionActionState extends HomeActionState {}

class HomeWishListNaviagtionActionState extends HomeActionState {}

class HomeCartNaviagtionActionState extends HomeActionState {}
