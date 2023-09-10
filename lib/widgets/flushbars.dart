part of depths;

extension SnackBarsX on BuildContext {
  Flushbar<T> showSuccessFlushBar<T>(String message) {
    return Flushbar<T>(
      message: message,
      messageColor: Theme.of(this).colorScheme.onPrimaryContainer,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      icon: Icon(LineIcons.checkCircle, color: Theme.of(this).colorScheme.onPrimaryContainer),
      shouldIconPulse: false,
      backgroundColor: Theme.of(this).colorScheme.primaryContainer,
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
}
