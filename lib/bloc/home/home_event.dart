part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickEvent extends HomeEvent{}

class HomeCartButtonClickEvent extends HomeEvent{}

//----------

class HomeProductWishlistClickEvent extends HomeEvent{}

class HomeProductCartClickEvent extends HomeEvent{}