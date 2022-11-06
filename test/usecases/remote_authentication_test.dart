import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/data/http/http.dart';
import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/usecases/usecases.dart';

class HttpClietSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClietSpy httpClient;
  String url;

  setUp(() {
    // arrange
    httpClient = HttpClietSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct values', () async {
    // act
    final params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
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
}
