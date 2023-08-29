import 'package:logger/logger.dart';

final depthsBasicLogger = Logger(
  printer: PrefixPrinter(PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 8,
    lineLength: 180,
    colors: false,
    printEmojis: true,
    printTime: false,
  )),
);
