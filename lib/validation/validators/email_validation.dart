import 'package:prodev/validation/protocols/protocols.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate({String value}) {
    final regexEmail = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]+$');
    final isvalid = value?.isNotEmpty != true || regexEmail.hasMatch(value);
    return isvalid ? null : 'Campo inválido';
  }
}