import 'package:bloc_poc/bloc/home_page/home_bloc.dart';
import 'package:bloc_poc/screen/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const WishlistPage()));
              },
              icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeInitial) {
            return const Center(
              child: Text('No Data Available!'),
            );
          } else if (state is HomeLoadingSuccessState) {
            return ListView.builder(
              itemCount: state.homeData.length,
              itemBuilder: (context, index) {
                final apiData = state.homeData[index];
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
                                homeBloc
                                    .add(HomeWishlistAddEvent(apiData, index));
                                state.homeData[index] = ProductData(
                                  category: apiData.category,
                                  description: apiData.description,
                                  id: apiData.id,
                                  image: apiData.image,
                                  price: apiData.price,
                                  title: apiData.title,
                                  status:
                                      state.homeData[index].status == 0 ? 1 : 0,
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                apiData.status == 0
                                    ? Icons.favorite_border
                                    : Icons.favorite,
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
          } else if (state is HomeErrorState) {
            return Column(
              children: [
                const Text("Please Try Again !"),
                const SizedBox(height: 12),
                ElevatedButton(
                    onPressed: () {
                      homeBloc.add(HomeInitialEvent());
                    },
                    child: const Text("Refresh"))
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
