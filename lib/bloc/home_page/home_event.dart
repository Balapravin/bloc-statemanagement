part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeWishlistAddEvent extends HomeEvent{
  final ProductData wishlistData;
  final int index;

  HomeWishlistAddEvent(this.wishlistData, this.index);
}
