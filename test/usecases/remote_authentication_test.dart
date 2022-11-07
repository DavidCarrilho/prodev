import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/data/http/http.dart';
import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/helpers/helpers.dart';
import 'package:prodev/domain/usecases/usecases.dart';

class HttpClietSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClietSpy httpClient;
  String url;
  AuthenticationParams params;

  setUp(() {
    // arrange
    httpClient = HttpClietSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(email: faker.internet.email(), secret: faker.internet.password());
  });
  test('Should call HttpClient with correct values', () async {
        when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenAnswer((_) async => {'accessToken': faker.guid.guid(), 'name': faker.person.name()});
    // act
    await sut.auth(params);
    // assert
    verify(httpClient.request(
      url: url,
      method: 'post',
      body: {
        'email': params.email,
        'password': params.secret,
      },
    ));
  });
  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    // arrange
    when(httpClient.request(
            url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);
    // act
    final future = sut.auth(params);

    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    // arrange
    when(httpClient.request(
            url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenThrow(HttpError.notFound);
    // act
    final future = sut.auth(params);

    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    // arrange
    when(httpClient.request(
            url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenThrow(HttpError.serverError);
    // act
    final future = sut.auth(params);
    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
  test('Should throw InvalidCredentialErro if HttpClient returns 401', () async {
    // arrange
    when(httpClient.request(
            url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenThrow(HttpError.unauthorized);
    // act
    final future = sut.auth(params);

    // assert
    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should throw an Account if HttpClient returns 200', () async {
    final accessToken = faker.guid.guid();
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenAnswer((_) async => {'accessToken': accessToken, 'name': faker.person.name()});
    final account = await  sut.auth(params);
    expect(account.token, accessToken);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
        .thenAnswer((_) async => {'invalid_key': 'invalid_value'});
    // act
    final future = sut.auth(params);
    // assert
    expect(future, throwsA(DomainError.unexpected));
  });
}
