import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/infra/cache/cache.dart';

class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage {}

void main() {
  LocalStorageAdapter sut;
  FlutterSecureStorageSpy secureStorage;
  String key;
  String value;

  setUp(() {
    secureStorage = FlutterSecureStorageSpy();
    sut = LocalStorageAdapter(secureStorage: secureStorage);
    key = faker.lorem.word();
    value = faker.guid.guid();
  });

  group('saveSecure', () {
    void mockSaveSecureError() {
      when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenThrow(Exception());
    }

    test('Should call save secure with correct values', () async {
      // act
      await sut.saveSecure(key: key, value: value);
      // assert
      verify(secureStorage.write(key: key, value: value));
    });

    test('Should throw if save secure throws', () async {
      mockSaveSecureError();
      try {
        sut.saveSecure(key: key, value: value);
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
  group('fetchSecure', () {
    PostExpectation mockFetchSecureCall = when(secureStorage.read(key: anyNamed('key')));

    void mockFetchSecure() {
      mockFetchSecureCall.thenAnswer((_) async => value);
    }

    void mockSaveSecureError() {
      mockFetchSecureCall.thenThrow(Exception());
    }

    setUp(() {
      mockFetchSecure();
    });

    test('Should call fecth secure with correct value', () async {
      // act
      await sut.fetchSecure(key);
      // assert
      verify(secureStorage.read(
        key: key,
      ));
    });

    test('Should return correc value on success', () async {
      // act
      final fetchedValue = await sut.fetchSecure(key);
      // assert
      expect(fetchedValue, value);
    });

    test('Should throw if fetch secure throws', () async {
      mockSaveSecureError();

      final future = sut.fetchSecure(key);

      expect(future, throwsA(TypeMatcher<Exception>()));
    });
  });
}
