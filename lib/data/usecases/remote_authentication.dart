import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prodev/data/models/models.dart';
import 'package:prodev/domain/entities/entities.dart';
import 'package:prodev/domain/helpers/domain_error.dart';
import 'package:prodev/domain/usecases/usecases.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).tojson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
        email: params.email,
        password: params.secret,
      );

  Map tojson() => {'email': email, 'password': password};
}
