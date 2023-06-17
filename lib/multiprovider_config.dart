
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/wishlist/wishlist_bloc.dart';

 final List<BlocProvider>  multiProvider = [
   BlocProvider<HomeBloc>(
     create: (BuildContext context) => HomeBloc(),
   ),

   BlocProvider<CartBloc>(
     create: (BuildContext context) => CartBloc(),
   ),

   BlocProvider<WishlistBloc>(
     create: (BuildContext context) => WishlistBloc(),
   ),
 ];