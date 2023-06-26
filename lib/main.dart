import 'package:bloc_poc/multibloc_provider_files.dart';
import 'package:bloc_poc/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: Colors.teal,
                centerTitle: true,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700))),
        home: MultiBlocProvider(
          providers: multiBlocProviderData,
          child: const LoginPage(),
        ));
  }
}
