import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/data/http/http.dart';
import 'package:prodev/infra/http/http.dart';
import 'package:test/test.dart';

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
    PostExpectation mockRequest() => when(client.post(
          any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ));
    void mockResponse(int statusCode, {String body = '{"any_key": "any_value"}'}) {
      mockRequest().thenAnswer((_) async => Response(body, statusCode));
    }

    setUp(() {
      mockResponse(200);
    });
    test('Should call post with correct values', () async {
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
      // act
      await sut.request(url: url, method: 'post');
      verify(client.post(
        any,
        headers: anyNamed('headers'),
      ));
    });

    test('Should return data if post returns 200', () async {
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, {'any_key': 'any_value'});
    });

    test('Should return null if post returns 200 with no data', () async {
      // arrange
      mockResponse(200, body: '');
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('Should return null if post returns 204', () async {
      // arrange
      mockResponse(204, body: '');
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('Should return null if post returns 204 with data', () async {
      // arrange
      mockResponse(204);
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('Should return null if post returns 204 with data', () async {
      // arrange
      mockResponse(204);
      // act
      final response = await sut.request(url: url, method: 'post');
      expect(response, null);
    });

    test('Should return BadRequestError if post returns 400', () async {
      // arrange
      mockResponse(400, body: "");
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.badRequest));
    });

    test('Should return BadRequestError if post returns 400', () async {
      // arrange
      mockResponse(400);
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.badRequest));
    });

    test('Should return Unauthorized if post returns 401', () async {
      // arrange
      mockResponse(401);
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.unauthorized));
    });

    test('Should return Unauthorized if post returns 403', () async {
      // arrange
      mockResponse(403);
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.forbidden));
    });

    test('Should return NotFound if post returns 404', () async {
      // arrange
      mockResponse(404);
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.notFound));
    });

    test('Should return ServerError if post returns 500', () async {
      // arrange
      mockResponse(500);
      // act
      final future = sut.request(url: url, method: 'post');
      expect(future, throwsA(HttpError.serverError));
    });
  });
}
