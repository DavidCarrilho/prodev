import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prodev/infra/cache/local_store_adapter.dart';

LocalStorageAdapter makeLocalStoraAdapter() {
  final secureStorage = FlutterSecureStorage();
  return LocalStorageAdapter(secureStorage: secureStorage);
}
