// freezed
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_failures.freezed.dart';

@freezed
sealed class TaskFailure with _$TaskFailure {
  factory TaskFailure.request({
    required DioException exception,
  }) = TaskFailureRequest;

  factory TaskFailure.statusCode({
    required int expected,
    int? actual,
  }) = TaskFailureStatusCode;

  factory TaskFailure.cast({
    required Type expected,
    required Type actual,
  }) = TaskFailureCast;

  factory TaskFailure.jsonDecode({
    required dynamic source,
  }) = TaskFailureJsonDecode;

  factory TaskFailure.model({
    required Type expected,
    Object? error,
    StackTrace? stackTrace,
  }) = TaskFailureModel;

  factory TaskFailure.missingField({
    required String field,
  }) = TaskFailureMissingField;

  factory TaskFailure.nullField({
    required String field,
  }) = TaskFailureNullField;
}
