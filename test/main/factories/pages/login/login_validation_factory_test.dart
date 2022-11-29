import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/main/factories/pages/pages.dart';
import 'package:prodev/validation/validators/validators.dart';

void main() {
  test('Should return the correct validations', () {
    // arrange
    final validations = makeLoginValidations();
    // assert
    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
    ]);
  });
}
