import 'package:flutter/material.dart';
import 'package:prodev/main/factories/pages/splash/splash.dart';
import 'package:prodev/ui/pages/splash/splash.dart';

Widget makeSplashPage() => SplashPage(presenter: makeGetxSplashPresenter());
