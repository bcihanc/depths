part of depths;

extension ContextExtension on BuildContext {
  /// Short for `DefaultTextStyle.of(context).style`.
  TextStyle get textStyle => DefaultTextStyle.of(this).style;

  /// Short for `Theme.of(context)`.
  ThemeData get theme => Theme.of(this);

  /// Short for `Theme.of(context).textTheme`.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Short for `Theme.of(context).colorScheme`.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Short for `MediaQuery.of(context)`.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Short for `FocusScope.of(context)`.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Short for `Navigator.of(context)`.
  NavigatorState get navigator => Navigator.of(this);

  /// hides soft keyboard using platform channel
  void hideKeyboard() => helpers.hideKeyboard(this);
}
