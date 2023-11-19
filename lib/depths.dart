library depths;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:logger/logger.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart';

import 'helpers/helper_functions.dart' as helpers;

import 'package:depths/helpers/helper_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
part 'helpers/store.dart';
part 'logger/depths_logger.dart';
part 'logger/sentry_logger.dart';
