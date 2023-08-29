library depths;

import 'dart:convert';

import 'package:creator_core/creator_core.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:depths/loggers/loggers.dart';
import 'package:depths/observers/creator_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

export 'extensions/context_extensions.dart';
export 'extensions/creator_extensions.dart';
export 'extensions/fpdart_extensions.dart';

class Depths {
  static final messagengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final logger = depthsBasicLogger;
  static DepthsCreatorObserver creatorObserver({
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
}
