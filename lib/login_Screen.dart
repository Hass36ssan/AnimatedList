// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'MyList.dart';
import 'Share/Comp.dart';
import 'register_Screen.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreen();
}

class _MyLoginScreen extends State<MyLoginScreen> {
  bool ispassword = true;
  final _formkey = GlobalKey<FormState>();
  final emailcontroler = TextEditingController();
  final passcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 240, 247),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: Myclipper(),
                  child: Container(
                    width: size.width,
                    height: size.height / 2.8,
                    color: mycolor,
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                mytextfield(
                    valditor: (value) {
                      if (value!.isEmpty) {
                        return 'This field cannot be empty';
                      } else if (emailcontroler.text.contains('@') == false ||
                          emailcontroler.text.contains('.') == false) {
                        return 'Please Enter a valid email';
                      }
                      return null;
                    },
                    textcontrol: emailcontroler,
                    padding: 30,
                    label: 'Email',
                    preicon: Icons.email,
                    hinttext: 'Exampe@test.com',
                    textinputtype: TextInputType.emailAddress),
                mytextfield(
                  valditor: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty';
                    } else if (passcontroler.text.length < 6) {
                      return 'Password must be at lest 6 char';
                    }
                    return null;
                  },
                  textcontrol: passcontroler,
                  padding: 30,
                  label: 'Password',
                  preicon: Icons.lock,
                  hinttext: 'Enter your password',
                  textinputtype: TextInputType.visiblePassword,
                  obscure: ispassword,
                  saficon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                    icon: ispassword == true
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: size.height * .03),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      navigatorRemoveall(
                          context: context,
                          widget: const Mylist(
                            title: 'MyList',
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 93, vertical: 15)),
                  child: const Text('Login', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: size.height * .025),
                OutlinedButton(
                  onPressed: () {
                    nextnavigator(
                        context: context, widget: const Registerscreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      side: BorderSide(width: 1, color: mycolor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 14)),
                  child: Text('Register',
                      style: TextStyle(color: mycolor, fontSize: 20)),
                ),
                SizedBox(height: size.height * .05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
