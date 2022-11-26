import 'package:flutter/material.dart';
import 'package:prodev/presentation/dependences/dependences.dart';
import 'package:prodev/validation/dependences/dependences.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    String error;
    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(value: value);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return error;
  }
}
