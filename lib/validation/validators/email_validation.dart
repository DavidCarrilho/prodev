import 'package:equatable/equatable.dart';
import 'package:prodev/validation/dependences/dependences.dart';

class EmailValidation extends Equatable implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  @override
  String validate({String value}) {
    final regexEmail = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+\.?[a-zA-Z]+$');
    final isvalid = value?.isNotEmpty != true || regexEmail.hasMatch(value);
    return isvalid ? null : 'Campo inválido';
  }

  @override
  List<Object> get props => [field];
}
