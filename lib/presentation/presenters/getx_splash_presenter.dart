import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodev/domain/usecases/usecases.dart';
import 'package:prodev/ui/pages/splash/splash.dart';

class GetxSplashPresenter implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;
  GetxSplashPresenter({
    @required this.loadCurrentAccount,
  });
  var _navigateTo = RxString();
  Stream<String> get navigateToStream => _navigateTo.stream;
  Future<void> checkAccount() async {
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account == null ? '/login' : '/surveys';
    } catch (error) {
      _navigateTo.value = '/login';
    }
  }
}
