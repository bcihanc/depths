part of depths;

class DepthsSentryLogger {
  static final _sentryLoggerInstance = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );

  static void sentryLogObserver(
    SentryLevel level,
    String message, {
    String? logger,
    Object? exception,
    StackTrace? stackTrace,
  }) {
    final isStackTraceEmptyOrNull = (stackTrace == null || stackTrace.toString().isEmpty);

    switch (level) {
      case SentryLevel.info:
        _sentryLoggerInstance.i('SENTRY => $message');
        break;
      case SentryLevel.debug:
        _sentryLoggerInstance.d('SENTRY => $message');
        break;
      case SentryLevel.warning:
        _sentryLoggerInstance.w(message, stackTrace: isStackTraceEmptyOrNull ? null : Trace.from(stackTrace), error: '👀 SENTRY => $exception');
        break;
      case SentryLevel.error:
        _sentryLoggerInstance.e(message, stackTrace: isStackTraceEmptyOrNull ? null : Trace.from(stackTrace), error: '👀 SENTRY => $exception');
        break;
      case SentryLevel.fatal:
        _sentryLoggerInstance.f(message, stackTrace: isStackTraceEmptyOrNull ? null : Trace.from(stackTrace), error: '👀 SENTRY => $exception');
        break;
    }
  }
}
