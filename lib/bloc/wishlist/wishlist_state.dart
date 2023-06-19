part of 'wishlist_bloc.dart';


abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistLoadingSuccessState extends WishlistState {
  final List<HomeProduct> product;
  WishlistLoadingSuccessState({required this.product});
}

class WishlistErrorState extends WishlistState {}

class WishlistRemoveState extends WishlistActionState {}
