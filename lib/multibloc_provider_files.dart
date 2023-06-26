import 'package:bloc_poc/bloc/home_page/home_bloc.dart';
import 'package:bloc_poc/bloc/wishlist_page/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_page/login_page_bloc.dart';

final List<BlocProvider> multiBlocProviderData = [
  BlocProvider<LoginPageBloc>(create: (context) => LoginPageBloc()),
  BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  BlocProvider<WishlistBloc>(create: (context) => WishlistBloc())
];
