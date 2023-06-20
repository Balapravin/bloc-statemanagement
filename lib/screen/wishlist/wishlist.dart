import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/bloc/wishlist/wishlist_bloc.dart';

import '../../widgets/rating_star.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);


  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
 wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  final wishlistBloc = WishlistBloc()
;  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      // listenWhen: (previous, current) => current is WishlistState,
      // buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        if(state is WishlistRemoveState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item Removed to Wishliste")));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case WishlistLoadingSuccessState:
            final successState = state as WishlistLoadingSuccessState;
            return Scaffold(
                appBar: AppBar(title: const Text('Wishlist')),
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
                                    wishlistBloc
                                        .add(WishlistRemoveEvent(apiData.id!));
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

          case WishlistErrorState:
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
