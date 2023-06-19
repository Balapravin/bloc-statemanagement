import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/screen/wishlist/wishlist_data.dart';

import '../../model/home_product_model.dart';

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
    emit(WishlistLoadingSuccessState(product: wishlist));
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEvent event, Emitter<WishlistState> emit) {
    wishlistData.removeWhere((element) => element.id == event.removeId);
    emit(WishlistLoadingSuccessState(product: wishlistData));
    emit(WishlistRemoveState());
  }
}
