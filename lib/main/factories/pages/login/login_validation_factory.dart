import 'package:prodev/presentation/dependences/dependences.dart';
import 'package:prodev/validation/dependences/dependences.dart';
import 'package:prodev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ];
}
