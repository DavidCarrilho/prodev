import 'package:flutter/material.dart';
import 'package:prodev/main/factories/factories.dart';
import 'package:prodev/ui/pages/pages.dart';

Widget makeLoginPage() => LoginPage(presenter: makeGetxLoginPresenter());
