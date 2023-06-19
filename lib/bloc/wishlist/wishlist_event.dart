part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}


class WishlistInitialEvent extends WishlistEvent{}

class WishlistRemoveEvent extends WishlistEvent{
  final int removeId;

  WishlistRemoveEvent(this.removeId);
}