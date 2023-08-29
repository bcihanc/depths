import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  TextStyle get ts {
    return DefaultTextStyle.of(this).style;
  }
}
