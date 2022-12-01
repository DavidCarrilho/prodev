import 'package:equatable/equatable.dart';
import 'package:prodev/validation/dependences/dependences.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;

  List get props => [field];

  RequiredFieldValidation(this.field);

  @override
  String validate({String value}) {
    return value?.isNotEmpty == true ? null : 'Campo obrigatório.';
  }


  // @override
  // bool operator ==(covariant RequiredFieldValidation other) {
  //   if (identical(this, other)) return true;

  //   return other.field == field;
  // }

  // @override
  // int get hashCode => field.hashCode;
}
