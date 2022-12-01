import 'package:prodev/validation/dependences/dependences.dart';
import 'package:prodev/validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder _instance;
  String filedName;
  List<FieldValidation> validations = [];

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder();
    _instance.filedName = fieldName;
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(filedName));
    return this;
  }
  
  ValidationBuilder email() {
    validations.add(RequiredFieldValidation(filedName));
    return this;
  }

  List<FieldValidation> build() => validations;
 }