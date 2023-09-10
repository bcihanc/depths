part of depths;

/// provides extensions for [State]
extension StateFS<T extends StatefulWidget> on State<T> {
  /// Short for `DefaultTextStyle.of(context).style`.
  TextStyle get textStyle => DefaultTextStyle.of(context).style;

  /// Short for `Theme.of(context)`.
  ThemeData get theme => Theme.of(context);

  /// Short for `Theme.of(context).colorScheme`.
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  /// Short for `Theme.of(context).textTheme`.
  TextTheme get textTheme => Theme.of(context).textTheme;

  /// Short for `MediaQuery.of(context)`.
  MediaQueryData get mediaQuery => MediaQuery.of(context);

  /// Short for `FocusScope.of(context)`.
  FocusScopeNode get focusScope => FocusScope.of(context);

  /// Short for `Navigator.of(context)`.
  NavigatorState get navigator => Navigator.of(context);

  /// hides soft keyboard using platform channel
  void hideKeyboard() => helpers.hideKeyboard(context);
}
