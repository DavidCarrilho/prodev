import 'package:prodev/main/builders/validation_builder.dart';
import 'package:prodev/presentation/dependences/dependences.dart';
import 'package:prodev/validation/dependences/dependences.dart';
import 'package:prodev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}
