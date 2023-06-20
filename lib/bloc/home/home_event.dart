part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickEvent extends HomeEvent{

}

class HomeToWishlistAddEvent extends HomeEvent{
  final HomeProduct saveData ;

  HomeToWishlistAddEvent(this.saveData);
}
