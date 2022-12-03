import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/data/cache/cache.dart';
import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/entities/entities.dart';
import 'package:prodev/domain/helpers/helpers.dart';

class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage {}

void main() {
  LocalSaveCurrentAccount sut;
  SaveSecureCacheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    account = AccountEntity(token: 'any_token');
  });

  void mockError() =>
      when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
          .thenThrow(Exception());
  test('Should call SaveSecureCacheStorage with correct values', () async {
    // act
    await sut.save(account);
    // assert
    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws ', () {
    mockError();
    // act
    final future = sut.save(account);
    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
}
