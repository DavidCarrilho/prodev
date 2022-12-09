import 'package:flutter/material.dart';

abstract class SaveSecureCacheStorage {
  Future<void> saveSecure({@required String key, @required String value});
}
