library depths;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:depths/observers/clear_focus_navigator_observer.dart';
import 'package:depths/observers/pods_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart';

import 'helpers/helper_functions.dart' as helpers;

part 'extensions/bool_extensions.dart';
part 'extensions/color_extensions.dart';
part 'extensions/context_extensions.dart';
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
part 'widgets/hide_keyboard.dart';

class DepthsObservers {
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

  static void sentryLogObserver(SentryLevel level,
      String message, {
        String? logger,
        Object? exception,
        StackTrace? stackTrace,
      }) {
    final isStackTraceEmptyOrNull = (stackTrace == null || stackTrace
        .toString()
        .isEmpty);

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

  static ClearFocusNavigatorObserver clearFocusNavigatorObserver() => ClearFocusNavigatorObserver();

  static final DepthsPodObserver podObserver = DepthsPodObserver();
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
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 180,
      colors: false,
      printEmojis: true,
      printTime: false,
    )),
  );
}
