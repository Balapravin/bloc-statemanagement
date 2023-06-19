part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoaderState extends HomeState {}

class HomeLoaderSuccessState extends HomeState {
  final List<HomeProduct> product;
  HomeLoaderSuccessState({required this.product});
}

class HomeWishListButtonNaviagtionActionState extends HomeActionState {}

class HomeWishListAddActionState extends HomeActionState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}
