import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager(this.seedColor);

  final Color seedColor;

  ThemeData _theme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);
    return ThemeData(useMaterial3: true, colorScheme: colorScheme);
  }

  ThemeData get light => _theme(Brightness.light);

  ThemeData get dark => _theme(Brightness.dark);
}
