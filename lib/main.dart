import 'package:flutter/material.dart';
import 'Share/Comp.dart';
import 'login_Screen.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: const MyLoginScreen(),
    );
  }
}
