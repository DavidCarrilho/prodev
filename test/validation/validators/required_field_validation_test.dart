import 'package:flutter_test/flutter_test.dart';

abstract class FieldValidator {
  String get field;
  String validate({String value});
}

class RequiredFieldValidation implements FieldValidator {
  final String field;

  RequiredFieldValidation(this.field);

  @override
  String validate({String value}) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório.';
  }
}

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
