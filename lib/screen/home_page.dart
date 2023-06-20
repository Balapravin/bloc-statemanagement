import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/bloc/home/home_bloc.dart';
import 'package:samplebloc/screen/wishlist/wishlist.dart';
import 'package:samplebloc/widgets/rating_star.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
              context, MaterialPageRoute(builder: (context) => const WishlistPage()));
        }else if(state is HomeWishListAddActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item Added to Wishliste")));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoaderState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoaderSuccessState:
            final successState = state as HomeLoaderSuccessState;
            return Scaffold(
                appBar: AppBar(title: const Text('Home'), actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonClickEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                ]),
                body: ListView.builder(
                  itemCount: successState.product.length,
                  itemBuilder: (context, index) {
                    final apiData = successState.product[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Image.network(apiData.image!, height: 200),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StartRating(
                                        ratingcount:
                                            apiData.rating!.rate!.toInt()),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      apiData.title!,
                                      style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                  onPressed: () {
                                    homeBloc
                                        .add(HomeToWishlistAddEvent(apiData));
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 35,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ));

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
