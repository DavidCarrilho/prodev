import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'splash_presenter.dart';


class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;

  const SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.loadCurrentAccount();

    return Scaffold(
      appBar: AppBar(
        title: Text('ProDev'),
      ),
      body: Builder(builder: (context) {
        presenter.navigateToStream.listen((page) {
          if (page?.isNotEmpty == true) {
            Get.offAllNamed(page);
          }
        });
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}