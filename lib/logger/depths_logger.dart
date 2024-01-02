part of depths;

void prettyPrintJson(String input) {
  const decoder = JsonDecoder();
  const encoder = JsonEncoder.withIndent('  ');

  final object = decoder.convert(input);
  final prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((element) => debugPrint(element));
}

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
