import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prodev/ui/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );

    final primaryColor = Color(0xFF7e57c2);
    final primaryColorDark = Color(0xFF4d2c91);
    final primaryColorLight = Color(0xFFb085f5);

    return Material(
      child: MaterialApp(
        title: 'ProDev',
        theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLight,
          accentColor: primaryColor,
          backgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColorLight),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              alignLabelWithHint: true),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(primary: primaryColor),
            buttonColor: primaryColor,
            splashColor: primaryColorLight,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}
