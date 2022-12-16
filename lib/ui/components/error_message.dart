import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      backgroundColor: Colors.red,
    ),
  );
}
