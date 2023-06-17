import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/bloc/home/home_bloc.dart';
import 'package:samplebloc/screen/cart.dart';
import 'package:samplebloc/screen/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeWishListButtonNaviagtionActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishlistPage()));
        } else if (state is HomeCartButtonNaviagtionActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoaderState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoaderSuccessState:
            return Scaffold(
              appBar: AppBar(title: Text('Home'), actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonClickEvent());
                    },
                    icon: Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonClickEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined))
              ]),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
