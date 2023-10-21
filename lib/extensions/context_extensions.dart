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

  Flushbar<T> showSuccessFlushBar<T>(String message) {
    return Flushbar<T>(
      message: message,
      messageColor: Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      icon: const Icon(LineIcons.checkCircle, color: Colors.white),
      shouldIconPulse: false,
      backgroundColor: Colors.green,
    )..show(this);
  }

  Flushbar<T> showErrorFlushBar<T>(String message) {
    return Flushbar<T>(
      message: message,
      messageColor: Theme.of(this).colorScheme.onError,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      icon: Icon(LineIcons.exclamationCircle, color: Theme.of(this).colorScheme.onError),
      shouldIconPulse: false,
      backgroundColor: Theme.of(this).colorScheme.error,
    )..show(this);
  }

  Flushbar<T> showInfoFlushBar<T>(String message) {
    return Flushbar<T>(
      message: message,
      messageColor: Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      icon: const Icon(LineIcons.infoCircle, color: Colors.white),
      shouldIconPulse: false,
      backgroundColor: Colors.blue,
    )..show(this);
  }

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
    if (currentFocus.hasFocus) {
      currentFocus.unfocus();
      currentFocus.focusedChild?.unfocus();
    }
  }
}
