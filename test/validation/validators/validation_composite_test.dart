import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prodev/presentation/dependences/dependences.dart';
import 'package:prodev/validation/dependences/dependences.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  test('Should returns null if all validations returns null or empty', () {
    // arrange
    final validation1 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    when(validation1.validate(value: anyNamed('value'))).thenReturn(null);
    final validation2 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    when(validation1.validate(value: anyNamed('value'))).thenReturn('');
    final sut = ValidationComposite([validation1, validation2]);
    // act
    final error = sut.validate(field: 'any_field', value: 'any_value');
    // assert
    expect(error, null);
  });
}
