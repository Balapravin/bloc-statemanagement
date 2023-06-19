import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:samplebloc/api_service/api_service,dart.dart';
import 'package:samplebloc/model/home_product_model.dart';
import 'package:samplebloc/screen/wishlist/wishlist_data.dart';

import '../../helper/helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonClickEvent>(homeWishlistButtonClickEvent);
    on<HomeToWishlistAddEvent>(homeToWishlistAddEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoaderState());
    try {
      final productData = await apiService.getProductData();
      emit(HomeLoaderSuccessState(product: productData));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> homeWishlistButtonClickEvent(
      HomeWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    helper.logger('WishList Clicked  👍');
    emit(HomeWishListButtonNaviagtionActionState());
  }

  FutureOr<void> homeToWishlistAddEvent(
      HomeToWishlistAddEvent event, Emitter<HomeState> emit) {
    wishlistData.add(event.saveData);
    emit(HomeWishListAddActionState());
  }
}
