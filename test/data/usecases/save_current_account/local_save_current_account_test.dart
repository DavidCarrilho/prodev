import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/domain/entities/entities.dart';
import 'package:prodev/domain/helpers/helpers.dart';
import 'package:prodev/domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({this.saveSecureCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
      await saveSecureCacheStorage.saveSecure(key: 'token', value: account.token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}

abstract class SaveSecureCacheStorage {
  Future<void> saveSecure({String key, String value});
}

class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage {}

void main() {
  test('Should call SaveSecureCacheStorage with correct values', () async {
    // arrange
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    final account = AccountEntity(token: 'any_token');
    // act
    await sut.save(account);
    // assert
    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws ', () {
    // arrange
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    final account = AccountEntity(token: 'any_token');
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
    // act
    final future = sut.save(account);
    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
}
