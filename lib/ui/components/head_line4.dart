import 'package:flutter/material.dart';

class HeadLine4 extends StatelessWidget {
  final String text;

  const HeadLine4({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
