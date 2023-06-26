import 'dart:async';

import 'package:bloc_poc/config/wishlist_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_data.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadingState());
    final wishlist = wishlistData;

    if (wishlist.isEmpty) {
      emit(WishlistInitial());
    } else if (wishlist.isNotEmpty) {
      emit(WishlistLoadingSuccessState(wishlist));
    } else {
      emit(WishlistErrorState());
    }
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEvent event, Emitter<WishlistState> emit) {
    wishlistData.removeWhere((element) => element.id == event.removeId);

    emit(WishlistRemoveSuccessState());
    emit(WishlistLoadingSuccessState(wishlistData));
  }
}
