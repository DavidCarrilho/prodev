import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/main/factories/pages/login/login.dart';
import 'package:prodev/validation/validators/validators.dart';

void main() {
  test('Should return the correct validations', () {
    final validations = makeLoginValidations();

    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
    ]);
  });
}