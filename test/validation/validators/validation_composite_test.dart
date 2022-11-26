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
  ValidationComposite sut;
  FieldValidationSpy validation1;
  FieldValidationSpy validation2;
  FieldValidationSpy validation3;

  // mockValidation1({String field, String value}) {
  //   when(validation1.field).thenReturn(field);
  //   when(validation1.validate(value: value)).thenReturn(value);
  // }

  mockValidation1(String error) {
    when(validation1.validate(value: anyNamed('value'))).thenReturn(error);
  }

  mockValidation2(String error) {
    when(validation2.validate(value: anyNamed('value'))).thenReturn(error);
  }

  mockValidation3(String error) {
    when(validation3.validate(value: anyNamed('value'))).thenReturn(error);
  }

  setUp(() {
    validation1 = FieldValidationSpy();
    when(validation1.field).thenReturn('any_field');
    when(validation1.validate(value: anyNamed('value'))).thenReturn(null);

    validation2 = FieldValidationSpy();
    when(validation2.field).thenReturn('any_field');
    when(validation2.validate(value: anyNamed('value'))).thenReturn('');

    validation3 = FieldValidationSpy();
    when(validation3.field).thenReturn('other_field');
    when(validation3.validate(value: anyNamed('value'))).thenReturn(null);
    sut = ValidationComposite([validation1, validation2, validation3]);
  });
  test('Should returns null if all validations returns null or empty', () {
    mockValidation1('');
    // act
    final error = sut.validate(field: 'any_field', value: 'any_value');
    // assert
    expect(error, null);
  });
}