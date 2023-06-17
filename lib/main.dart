import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/screen/home_page.dart';

import 'multiprovider_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: multiProvider,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  centerTitle: true,

                  backgroundColor: Colors.teal,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 20,
                  )),
             ),
          home: const HomePage()),
    );
  }
}
