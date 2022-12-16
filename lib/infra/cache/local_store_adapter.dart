import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prodev/data/cache/cache.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({@required this.secureStorage});

  Future<void> saveSecure({@required String key, @required String value}) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchSecure(String key) async {
    await secureStorage.read(key: key);
  }
}
