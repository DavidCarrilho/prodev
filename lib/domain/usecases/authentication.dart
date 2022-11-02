import 'package:flutter/material.dart';
import 'package:prodev/domain/entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    AuthenticationParams params,
  });
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  Map tojson() => {'email': email, 'password': secret};
}
