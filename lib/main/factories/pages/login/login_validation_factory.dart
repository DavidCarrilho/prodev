import 'package:prodev/presentation/dependences/dependences.dart';
import 'package:prodev/validation/validators/validators.dart';

Validation makeLoginValidation () {
   return ValidationComposite(
    [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
    ],
  );
}
