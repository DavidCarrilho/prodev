import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/validation/protocols/field_validation.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate({String value}) {
    return null;
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
}
