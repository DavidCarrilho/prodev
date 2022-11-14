import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: EdgeInsets.only(bottom: 32), child: FlutterLogo(size: 200)),
      ],
    );
  }
}

