
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/bloc/login/login_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/wishlist/wishlist_bloc.dart';

final List<BlocProvider> multiProvider = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
  BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  BlocProvider<WishlistBloc>(create: (context) => WishlistBloc()),
];
