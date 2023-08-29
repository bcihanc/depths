import 'package:creator_core/creator_core.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class DepthsCreatorObserver extends CreatorObserver {
  final _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );
  DepthsCreatorObserver({
    this.logInReleaseMode = false,
    this.logStateChange = true,
    this.logState = true,
    this.logError = true,
    this.logDispose = false,
    this.logWatcher = false,
    this.logDerived = false,
  });

  /// Whether to log in release mode. Default to false.
  final bool logInReleaseMode;

  /// Whether to log state change events. Default to true.
  final bool logStateChange;

  /// Whether to log the state object when state changes. Default to true.
  final bool logState;

  /// Whether to log error events. Default to true.
  final bool logError;

  /// Whether to log dispose events. Default to false.
  final bool logDispose;

  /// Whether to log [Watcher] that has a default name. Default to false to
  /// reduce log amount.
  final bool logWatcher;

  /// Whether to log derived creators (.asyncData, .change). Default to false to
  /// reduce log amount.
  final bool logDerived;

  @override
  void onStateChange(CreatorBase creator, Object? before, Object? after) {
    if (!kDebugMode && !logInReleaseMode) {
      return;
    }
    if (!logStateChange || ignore(creator)) {
      return;
    }
    if (logState) {
      _logger.i('[Creator] ${creator.infoName}: $after');
    } else {
      _logger.i('[Creator][Change] ${creator.infoName}');
    }
  }

  @override
  void onError(CreatorBase creator, Object? error, StackTrace? stackTrace) {
    if (!kDebugMode && !logInReleaseMode) {
      return;
    }
    if (!logError || ignore(creator)) {
      return;
    }
    _logger.e('[Creator][Error] ${creator.infoName}: $error\n$stackTrace');
  }

  @override
  void onDispose(CreatorBase creator) {
    if (!kDebugMode && !logInReleaseMode) {
      return;
    }
    if (!logDispose || ignore(creator)) {
      return;
    }
    _logger.w('[Creator][Dispose] ${creator.infoName}');
  }

  /// Ignore a few derived creators to reduce log amount.
  bool ignore(CreatorBase creator) {
    if (creator.name == 'watcher' || creator.name == 'listener') {
      return !logWatcher;
    } else if ((creator.name?.endsWith('_asyncData') ?? false) ||
        (creator.name?.endsWith('_change') ?? false)) {
      return !logDerived;
    }
    return false;
  }
}
