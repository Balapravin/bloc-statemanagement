import 'package:bloc_poc/bloc/wishlist_page/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Listener'),
        ),
        body: BlocListener<WishlistBloc, WishlistState>(
            listener: (context, state) {
              if (state is WishlistRemoveSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Wishlist Removed Successfully..!')));
              }
            },
            bloc: wishlistBloc,
            child: BlocBuilder<WishlistBloc, WishlistState>(
                bloc: wishlistBloc,
                builder: (context, state) {
              if (state is WishlistInitial) {
                return const Center(
                  child: Text("No Data..!"),
                );
              } else if (state is WishlistLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WishlistLoadingSuccessState) {
                return ListView.builder(
                  itemCount: state.wishlistData.length,
                  itemBuilder: (context, index) {
                    final apiData = state.wishlistData[index];
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
                                child: Text(
                                  apiData.title!,
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                  onPressed: () {
                                    wishlistBloc
                                        .add(WishlistRemoveEvent(apiData.id!));
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 35,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (state is WishlistErrorState) {
                return Column(
                  children: [
                    const Text("Something went wrong..!"),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          wishlistBloc.add(WishlistInitialEvent());
                        },
                        child: const Text("Retry"))
                  ],
                );
              } else {
                return Container();
              }
            })));
  }
}
