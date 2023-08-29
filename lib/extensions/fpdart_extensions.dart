import 'dart:convert';

import 'package:creator/creator.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

extension FutureTaskEither on Future<Response> {
  // Level: 1 - request
  TaskEither<TaskFailure, Response<dynamic>> safeRequest() =>
      TaskEither<TaskFailure, Response<dynamic>>.tryCatch(() => this, (error, stackTrace) => TaskFailure.request(exception: error as DioException));
}

extension TaskEitherResponse on TaskEither<TaskFailure, Response> {
  // Level: 2 - statusCode
  TaskEither<TaskFailure, Response> safeStatusCode({int? expectedStatusCode}) => chainEither<Response>((r) => Either<TaskFailure, Response>.fromPredicate(
      r, (r) => r.statusCode == (expectedStatusCode ?? 200), (r) => TaskFailure.statusCode(expected: (expectedStatusCode ?? 200), actual: r.statusCode)));

  // Level: 3 - response data
  TaskEither<TaskFailure, Map<String, dynamic>> safeMapCast() {
    return chainEither<Map<String, dynamic>>((r) {
      if (r.data is Map<String, dynamic>) {
        return Either<TaskFailure, Map<String, dynamic>>.safeCast(r.data, (r) => TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType));
      } else if (r.data is String) {
        return Either<TaskFailure, String>.safeCast(r.data, (r) => TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType)).flatMap(
            (a) => Either<TaskFailure, Map<String, dynamic>>.tryCatch(() => jsonDecode(r.data), (error, stackTrace) => TaskFailure.jsonDecode(source: r.data)));
      } else {
        return Either<TaskFailure, Map<String, dynamic>>.left(TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType));
      }
    });
  }

  TaskEither<TaskFailure, List<Map<String, dynamic>>> safeListMapCast() {
    return chainEither<List<Map<String, dynamic>>>((r) {
      if (r.data is List<dynamic>) {
        return Either<TaskFailure, List<Map<String, dynamic>>>.safeCast(
            (r.data as List<dynamic>).cast<Map<String, dynamic>>(), (r) => TaskFailure.cast(expected: List<Map<String, dynamic>>, actual: r.runtimeType));
      } else {
        return Either<TaskFailure, List<Map<String, dynamic>>>.left(TaskFailure.cast(expected: List<Map<String, dynamic>>, actual: r.data.runtimeType));
      }
    });
  }
}

extension TaskEitherMap on TaskEither<TaskFailure, Map<String, dynamic>> {
// Level: 4 - field
  TaskEither<TaskFailure, Map<String, dynamic>> safeExistField({required String field}) {
    return chainEither((r) {
      return r.lookup(field).toEither<TaskFailure>(() => TaskFailure.missingField(field: field));
    }).chainEither((r) {
      return Either<TaskFailure, Map<String, dynamic>>.safeCast(r, (r) => TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType));
    });
  }

// Level: 5 - model
  TaskEither<TaskFailure, T> safeModel<T>(T Function(Map<String, dynamic> json) fromJson) => chainEither<T>((data) => Either<TaskFailure, T>.tryCatch(() {
        return fromJson(data);
      }, (error, stackTrace) {
        return TaskFailure.model(expected: T);
      }));
}

extension TaskEitherListMap on TaskEither<TaskFailure, List<Map<String, dynamic>>> {
  TaskEither<TaskFailure, List<T>> safeModel<T>(T Function(Map<String, dynamic> json) fromJson) =>
      chainEither<List<T>>((data) => Either<TaskFailure, List<T>>.tryCatch(() {
            return data.map((e) => fromJson(e)).toList();
          }, (error, stackTrace) {
            return TaskFailure.model(expected: T);
          }));
}

extension TaskEitherEmitter<T> on TaskEither<TaskFailure, T> {
  Emitter<T> emitter({String? name, bool keepAlive = false, List<Object?>? args}) {
    return Emitter(
      (ref, emit) async {
        final result = await run();
        result.fold((l) => emit(null, l), (r) => emit(r));
      },
      name: name,
      keepAlive: keepAlive,
      args: args,
    );
  }
}
