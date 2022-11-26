import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/validation/validators/validators.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Shoukd returns null if email is empty', () {
    // act
    final error = sut.validate(value: '');
    // assert
    expect(error, null);
  });

  test('Shoukd returns null if email is empty', () {
    // act
    final error = sut.validate(value: null);
    // assert
    expect(error, null);
  });

  test('Shoukd returns null if email is valid', () {
    // act
    final error = sut.validate(value: 'email@gmail.com',);
    // assert
    expect(error, null);
  });

  test('Shoukd returns errir if email is invalid', () {
    // act
    final error = sut.validate(value: 'email.email',);
    // assert
    expect(error, 'Campo inválido');
  });
}
