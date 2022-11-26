import 'package:flutter/material.dart';

abstract class Validation {
  String validate({@required String field, @required String value});
}
