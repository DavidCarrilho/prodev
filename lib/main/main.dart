import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:prodev/ui/components/component.dart';

import 'factories/factories.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );

    return GetMaterialApp(
      title: 'ProDev',
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => makeSplashPage(), transition: Transition.fade),
        GetPage(name: '/login', page: () => makeLoginPage(), transition: Transition.fadeIn),
        GetPage(
          name: '/surveys',
          page: () => Scaffold(body: Center(child: Text('Enquetes'))),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
