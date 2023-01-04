import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/state_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/domain/usecases/load_current_account.dart';
import 'package:prodev/ui/pages/splash/splash.dart';

class GetxSplashPresenter implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;
  GetxSplashPresenter({
    @required this.loadCurrentAccount,
  });
  var _navigateTo = RxString();
  Stream<String> get navigateToStream => _navigateTo.stream;
  Future<void> checkAccount() async {
    await loadCurrentAccount.load();
  }
}

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

void main() {
  GetxSplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;
  setUp(() {
    // arrange
    loadCurrentAccount = LoadCurrentAccountSpy();
    sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
  });
  test('Should call LoadCurrentAccount', () {
    // act
    sut.checkAccount();
    // assert
    verify(loadCurrentAccount.load()).called(1);
  });
}
