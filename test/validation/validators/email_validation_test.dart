import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/validation/protocols/field_validation.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate({String value}) {
    final regexEmail = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]+$');
    final isvalid = value?.isNotEmpty != true || regexEmail.hasMatch(value);
    return isvalid ? null : 'Campo inválido';
  }
}

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
