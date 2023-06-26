part of 'wishlist_bloc.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistLoadingSuccessState extends WishlistState {
  final List<ProductData> wishlistData;
  WishlistLoadingSuccessState(this.wishlistData);
}

class WishlistRemoveSuccessState extends WishlistState {}

class WishlistErrorState extends WishlistState {}
