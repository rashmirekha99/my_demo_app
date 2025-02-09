import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  Color? color = Colors.white,
}) {
  ScaffoldMessenger.of(context)
    //hide current snack bar
    ..hideCurrentSnackBar()
    //show current snack bar
    ..showSnackBar(
      SnackBar(
        elevation: 10,
        backgroundColor: color,
        showCloseIcon: true,

        content: Text(message),
      ),
    );
}
