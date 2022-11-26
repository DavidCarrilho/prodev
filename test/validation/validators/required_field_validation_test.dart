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
    return null;
  }
}

void main() {
  test('Should returns null if value is not empty', () {
    // arrange
    final sut = RequiredFieldValidation('any_field');
    // act
    final error = sut.validate(value: 'any_value');
    // assert
    expect(error, null);
  });
}
