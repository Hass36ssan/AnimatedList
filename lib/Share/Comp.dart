// ignore_for_file: file_names

import 'package:flutter/material.dart';

MaterialColor mycolor = Colors.blueGrey;

Widget mytextfield({
  required double padding,
  required String label,
  required IconData preicon,
  required TextEditingController textcontrol,
  required String? Function(String?)? valditor,
  IconButton? saficon,
  bool obscure = false,
  TextInputType textinputtype = TextInputType.text,
  String? hinttext,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding,
      vertical: padding * .3,
    ),
    child: TextFormField(
      validator: valditor,
      controller: textcontrol,
      keyboardType: textinputtype,
      decoration: InputDecoration(
        prefixIcon: Icon(preicon),
        suffixIcon: saficon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2),
        ),
        hintText: hinttext,
        label: Text(label),
      ),
      obscureText: obscure,
      enableSuggestions: !obscure,
      autocorrect: !obscure,
    ),
  );
} //mytextfield

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(
      size.width / 2 * 0.6,
      size.height * 0.5,
      size.width * 2 / 2,
      size.height * 1.2,
      size.width * 1.2,
      size.height / 1.5,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Future nextnavigator({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future navigatorRemoveall({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
