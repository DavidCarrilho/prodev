import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/data/http/http_client.dart';
import 'package:test/test.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  }) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );
    return jsonDecode(response.body);
  }
}

class ClientSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('post', () {
    test('Should call post with correct values', () async {
      // arrange
      when(client.post(any, body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('{"any_key":"any_value"}', 200));
      // act
      await sut.request(url: url, method: 'post', body: {'any_key': 'any_value'});
      verify(client.post(
        url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
        body: '{"any_key":"any_value"}',
      ));
    });

    test('Should call post without body', () async {
      // arrange
      when(client.post(any, body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('{"any_key":"any_value"}', 200));
      // act
      await sut.request(url: url, method: 'post');
      verify(client.post(
        any,
        headers: anyNamed('headers'),
      ));
    });

    test('Should return data if post returns 200', () async {
      when(client.post(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response('{"any_key":"any_value"}', 200));
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, {'any_key': 'any_value'});
    });
  });
}
