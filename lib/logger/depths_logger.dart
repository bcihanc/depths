part of depths;

class DepthsLoggers {
  DepthsLoggers._();

  static final DepthsLoggers _instance = DepthsLoggers._();

  factory DepthsLoggers() => _instance;

  static final basic = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );

  static final advanced = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 4,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );
}
