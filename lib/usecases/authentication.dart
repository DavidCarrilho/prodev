import 'package:flutter/material.dart';
import 'package:prodev/domain/entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}