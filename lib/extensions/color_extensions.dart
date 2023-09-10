// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by a BSD 3-Clause License that can be
// found in the LICENSE file.

// Author: Birju Vachhani
// Created Date: September 01, 2020

part of depths;

/// Provides extensions for [Color]
extension ColorFS on Color {
  /// converts a normal [Color] to material color with proper shades mixed
  /// with base color (white).
  MaterialColor toMaterialColor() {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        red + ((ds < 0 ? red : (255 - red)) * ds).round(),
        green + ((ds < 0 ? green : (255 - green)) * ds).round(),
        blue + ((ds < 0 ? blue : (255 - blue)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }

  /// Returns hex string of [this] color
  String get hexString => '#${value.toRadixString(16).padLeft(8, '0')}';

  /// Returns the brightness of this color
  Brightness get brightness => ThemeData.estimateBrightnessForColor(this);

  /// Returns true if this color is a light color and has light brightness.
  bool get isLight => brightness == Brightness.light;

  /// Returns true if this color is a dark color and has dark brightness.
  bool get isDark => brightness == Brightness.dark;
}

/// Generates a random color value.
Color randomColor() => Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
