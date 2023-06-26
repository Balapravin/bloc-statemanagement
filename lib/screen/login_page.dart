import 'package:bloc_poc/bloc/login_page/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginBloc = LoginPageBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageBloc, LoginPageState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => const HomePage()),
          //     (route) => false);
        } else if (state is LoginFailedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        // TODO: implement listener
      },
      bloc: loginBloc,
      builder: (context, state) {
        if (state is LoginPageInitial) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Bloc Consumer'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    TextFormField(
                      key: const Key('login_email'),
                      controller: email,
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.greenAccent,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.greenAccent,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      key: const Key('login_password'),
                      controller: password,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.greenAccent,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.greenAccent,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      key: const Key('login_button'),
                      onTap: () {
                        loginBloc.add(
                            LoginButtonClickEvent(email.text, password.text));
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.teal,
                        ),
                        child: const Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ));
        } else if (state is LoginLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginErrorState) {
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Please Retry ...!"),
                const SizedBox(height: 12),
                ElevatedButton(
                    onPressed: () {
                      loginBloc.add(LoginRetryEvent());
                    },
                    child: const Text('Retry'))
              ],
            )),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
