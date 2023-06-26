import 'dart:async';
import 'package:bloc_poc/api_service/api_service.dart';
import 'package:bloc_poc/config/wishlist_data.dart';
import 'package:bloc_poc/helper/helper.dart';
import 'package:bloc_poc/model/product_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistAddEvent>(homeWishlistAddEvent);
  }
  Future homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    List<ProductData> loadData=[];
    try {
      emit(HomeLoadingState());
     loadData  = await apiService.getProductData();
      if (loadData.isEmpty ) {
        emit(HomeInitial());
      } else if (loadData.isNotEmpty ) {
        emit(HomeLoadingSuccessState(loadData));
      } else {
        emit(HomeErrorState());
      }
    } catch (error) {
      helper.logger(error.toString());
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeWishlistAddEvent(
      HomeWishlistAddEvent event, Emitter<HomeState> emit) {
    wishlistData.add(ProductData(
      category: event.wishlistData.category,
      description: event.wishlistData.description,
      id: event.wishlistData.id,
      image: event.wishlistData.image,
      price: event.wishlistData.price,
      title: event.wishlistData.title,
      status: 1,
    ));
  }
}
