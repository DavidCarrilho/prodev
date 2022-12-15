import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prodev/domain/entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth(
    AuthenticationParams params,
  );
}

class AuthenticationParams extends Equatable {
  final String email;
  final String secret;

  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  List get props => [email, secret];

  // @override
  // bool operator ==(covariant AuthenticationParams other) {
  //   if (identical(this, other)) return true;
  
  //   return 
  //     other.email == email &&
  //     other.secret == secret;
  // }

  // @override
  // int get hashCode => email.hashCode ^ secret.hashCode;
}
