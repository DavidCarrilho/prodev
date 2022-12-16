import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LocalLoadCurrentAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorage});

  Future<void> load() async {
    await fetchSecureCacheStorage.fetch('token');
  }
}

class FetchSecureCacheStorage {
  Future<void> fetch(String key) async {}
}

class FetchSecureCacheStorageSpy extends Mock implements FetchSecureCacheStorage {}

void main() {
  LocalLoadCurrentAccount sut;
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  setUp(() {
    // arrange
    sut = LocalLoadCurrentAccount(fetchSecureCacheStorage: fetchSecureCacheStorage);
    fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
  });

  test('Should call FetchSecureCacheStorage with currect value', () async {
    await sut.load();

    verify(fetchSecureCacheStorage.fetch('token'));
  });
}
