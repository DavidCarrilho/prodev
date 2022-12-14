import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AccountEntity extends Equatable {
  final String token;

  AccountEntity(@required this.token);

  @override
  List get props => [token];

  // AccountEntity copyWith({
  //   String token,
  // }) {
  //   return AccountEntity(
  //     token: token ?? this.token,
  //   );
  // }
}
