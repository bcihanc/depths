library depths;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:creator/creator.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:depths/helpers/theme_manager.dart';
import 'package:depths/observers/clear_focus_navigator_observer.dart';
import 'package:depths/observers/creator_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stack_trace/stack_trace.dart';

import 'helpers/helper_functions.dart' as helpers;

part 'extensions/bool_extensions.dart';
part 'extensions/color_extensions.dart';
part 'extensions/context_extensions.dart';
part 'extensions/creator_extensions.dart';
part 'extensions/datetime_extensions.dart';
part 'extensions/double_extensions.dart';
part 'extensions/fpdart_extensions.dart';
part 'extensions/int_extensions.dart';
part 'extensions/iterable_extensions.dart';
part 'extensions/map_extensions.dart';
part 'extensions/object_extensions.dart';
part 'extensions/primitives_extensions.dart';
part 'extensions/state_extensions.dart';
part 'extensions/string_extensions.dart';
part 'widgets/flushbars.dart';
part 'widgets/hide_keyboard.dart';

class _DepthsObservers {
  _DepthsObservers._();

  static final _DepthsObservers _instance = _DepthsObservers._();

  factory _DepthsObservers() => _instance;

  final _sentryLoggerInstance = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );

  void sentryLogObserver(
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

  DepthsCreatorObserver creatorObserver({
    bool logInReleaseMode = false,
    bool logStateChange = true,
    bool logState = true,
    bool logError = true,
    bool logDispose = false,
    bool logWatcher = false,
    bool logDerived = false,
  }) =>
      DepthsCreatorObserver(
        logDerived: logDerived,
        logDispose: logDispose,
        logError: logError,
        logInReleaseMode: logInReleaseMode,
        logState: logState,
        logStateChange: logStateChange,
        logWatcher: logWatcher,
      );

  ClearFocusNavigatorObserver clearFocusNavigatorObserver() => ClearFocusNavigatorObserver();
}

class _DepthsLogger {
  _DepthsLogger._();

  static final _DepthsLogger _instance = _DepthsLogger._();

  factory _DepthsLogger() => _instance;

  final basic = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );
}

class Depths {
  Depths._();

  static final observers = _DepthsObservers._instance;
  static final loggers = _DepthsLogger._instance;
  static ThemeManager themeManager(Color color) => ThemeManager(color);
}
