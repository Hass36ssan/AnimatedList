// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Share/Comp.dart';
import 'login_Screen.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _Registerscreen();
}

class _Registerscreen extends State<Registerscreen> {
  bool ispassword = true;

  final _formkey = GlobalKey<FormState>();
  final namecontroler = TextEditingController();
  final phonecontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final passcontroler = TextEditingController();
  final confpasscontroler = TextEditingController();
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
                  child: Stack(children: [
                    Container(
                      width: size.width,
                      height: size.height / 3.5,
                      color: mycolor,
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height / 30,
                      left: size.width / 50,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return const MyLoginScreen();
                          }), (route) => false);
                        },
                        icon: const Icon(Icons.arrow_back, size: 30),
                      ),
                    )
                  ]),
                ),
                mytextfield(
                    valditor: (value) {
                      if (value!.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                    textcontrol: namecontroler,
                    padding: 30,
                    label: 'Full Name',
                    preicon: Icons.person_pin_circle_outlined,
                    hinttext: 'Enter Your Full Name',
                    textinputtype: TextInputType.text),
                mytextfield(
                    valditor: (value) {
                      if (value!.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                    textcontrol: phonecontroler,
                    padding: 30,
                    label: 'Phone',
                    preicon: Icons.phone,
                    hinttext: 'Example 01123456789',
                    textinputtype: TextInputType.phone),
                mytextfield(
                    valditor: (value) {
                      if (value!.isEmpty) {
                        return 'This field cannot be empty';
                      } else if (emailcontroler.text.contains("@") == false ||
                          emailcontroler.text.contains(".") == false) {
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
                    } else if (passcontroler.text != confpasscontroler.text) {
                      return "password doesn't match";
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
                mytextfield(
                  valditor: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty';
                    } else if (confpasscontroler.text.length < 6) {
                      return 'Password must be at lest 6 char';
                    } else if (passcontroler.text != confpasscontroler.text) {
                      return "password doesn't match";
                    }
                    return null;
                  },
                  textcontrol: confpasscontroler,
                  padding: 30,
                  label: 'Confirm Password',
                  preicon: Icons.lock,
                  hinttext: 'Confirm your password',
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
                OutlinedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {}
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
                SizedBox(height: size.height * .025),
                ElevatedButton(
                  onPressed: () {
                    navigatorRemoveall(
                        context: context, widget: const MyLoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 93, vertical: 15)),
                  child: const Text('Login', style: TextStyle(fontSize: 20)),
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
