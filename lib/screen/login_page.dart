import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplebloc/bloc/login/login_bloc.dart';
import 'package:samplebloc/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginbloc = LoginBloc();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginButtonSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
        } else if (state is LoginButtonFaildState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Login Failed')));
        }
        // TODO: implement listener
      },
      bloc: loginbloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                TextFormField(
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
                  onTap: () {
                    loginbloc.add(LoginButtonEvent(email.text, password.text));
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
