import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/validation/validators/validators.dart';

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should returns null if value is not empty', () {
    // act
    final error = sut.validate(value: 'any_value');
    // assert
    expect(error, null);
  });

  test('Should returns error if value is not empty', () {
    // act
    final error = sut.validate(value: '');
    // assert
    expect(error, 'Campo obrigatório.');
  });

  test('Should returns error if value is null', () {
    // act
    final error = sut.validate(value: null);
    // assert
    expect(error, 'Campo obrigatório.');
  });
}
