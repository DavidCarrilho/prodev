import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/domain/entities/entities.dart';
import 'package:prodev/domain/usecases/usecases.dart';
import 'package:prodev/presentation/presenters/presenters.dart';

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

void main() {
  GetxSplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;

  PostExpectation mockLoadCurrentAccountCall() => when(loadCurrentAccount.load());

  void mockLoadCurrentAccount({AccountEntity account}) {
    mockLoadCurrentAccountCall().thenAnswer((_) async => account);
  }

  void mockLoadCurrentAccountError() {
    mockLoadCurrentAccountCall().thenThrow(Exception());
  }

  setUp(() {
    // arrange
    loadCurrentAccount = LoadCurrentAccountSpy();
    sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
    mockLoadCurrentAccount(account: AccountEntity(faker.guid.guid()));
  });
  test('Should call LoadCurrentAccount', () {
    // act
    sut.checkAccount();
    // assert
    verify(loadCurrentAccount.load()).called(1);
  });

  test('Should go to surveys page on success', () async {
    // act
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/surveys')));
    // assert
    await sut.checkAccount();
  });

  test('Should go to login page on null result', () async {
    // arrange
    mockLoadCurrentAccount(account: null);
    // act
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));
    // assert
    await sut.checkAccount();
  });

  test('Should go to login page on error', () async {
    // arrange
    mockLoadCurrentAccountError();
    // act
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));
    // assert
    await sut.checkAccount();
  });
}
