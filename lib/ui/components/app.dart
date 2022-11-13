import 'package:flutter/material.dart';
import 'package:prodev/ui/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        title: 'ProDev',
        home: LoginPage(),
      ),
    );
  }
}
