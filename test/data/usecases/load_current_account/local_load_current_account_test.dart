import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/domain/entities/account_entity.dart';
import 'package:prodev/domain/helpers/helpers.dart';
import 'package:prodev/domain/usecases/usecases.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorage});

  Future<AccountEntity> load() async {
    try {
      final token = await fetchSecureCacheStorage.fetchSecure('token');
      return AccountEntity(token);
    } catch (eroor) {
      throw DomainError.unexpected;
    }
  }
}

abstract class FetchSecureCacheStorage {
  Future<String> fetchSecure(String key);
}

class FetchSecureCacheStorageSpy extends Mock implements FetchSecureCacheStorage {}

void main() {
  LocalLoadCurrentAccount sut;
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  String token;
  PostExpectation mockFetchSecureCall() => when(fetchSecureCacheStorage.fetchSecure(any));

  void mockFetchSecure() {
    mockFetchSecureCall().thenAnswer((_) async => token);
  }

  void mockFetchSecureError() {
    mockFetchSecureCall().thenThrow(Exception());
  }

  setUp(() {
    // arrange
    sut = LocalLoadCurrentAccount(fetchSecureCacheStorage: fetchSecureCacheStorage);
    fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
    token = faker.guid.guid();
    mockFetchSecure();
  });

  test('Should call FetchSecureCacheStorage with currect value', () async {
    await sut.load();

    verify(fetchSecureCacheStorage.fetchSecure('token'));
  });

  test('Should return when AccountEntity', () async {
    final account = await sut.load();

    expect(account, AccountEntity(token));
  });

  test('Should thwow UnexpectedError if FetchSecureCacheStore  throws', () {
    mockFetchSecureError();

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}
