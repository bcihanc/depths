part of depths;

extension FutureTaskEither on Future<Response> {
  TaskEither<TaskFailure, Response<dynamic>> safeRequest() =>
      TaskEither<TaskFailure, Response<dynamic>>.tryCatch(() => this, (error, stackTrace) => TaskFailure.request(exception: error as DioException));
}

extension TaskEitherResponse on TaskEither<TaskFailure, Response> {
  TaskEither<TaskFailure, Response> safeStatusCodes({List<int> expect = const [200]}) => chainEither<Response>((r) {
        return Either<TaskFailure, Response>.fromPredicate(r, (r) {
          return expect.any((element) => element == r.statusCode || r.statusCode == HttpStatus.ok);
        }, (r) => TaskFailure.statusCode(expected: expect, actual: r.statusCode));
      });

  TaskEither<TaskFailure, Map<String, dynamic>> safeCastMap() {
    return chainEither<Map<String, dynamic>>((r) {
      if (r.data is Map<String, dynamic>) {
        return Either<TaskFailure, Map<String, dynamic>>.safeCast(r.data, (r) {
          return TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType);
        });
      } else if (r.data is String) {
        return Either<TaskFailure, String>.safeCast(r.data, (r) => TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType)).flatMap(
            (a) => Either<TaskFailure, Map<String, dynamic>>.tryCatch(() => jsonDecode(r.data), (error, stackTrace) => TaskFailure.jsonDecode(source: r.data)));
      } else {
        return Either<TaskFailure, Map<String, dynamic>>.left(TaskFailure.cast(expected: Map<String, dynamic>, actual: r.data.runtimeType));
      }
    });
  }

  TaskEither<TaskFailure, String> safeCastString() {
    return chainEither<String>((r) {
      if (r.data is String) {
        return Either<TaskFailure, String>.safeCast(r.data, (r) => TaskFailure.cast(expected: String, actual: r.runtimeType));
      } else if (r.data is Map<String, dynamic>) {
        return Either<TaskFailure, Map<String, dynamic>>.safeCast(r.data, (r) => TaskFailure.cast(expected: String, actual: r.runtimeType))
            .flatMap((a) => Either<TaskFailure, String>.tryCatch(() => jsonEncode(r.data), (error, stackTrace) => TaskFailure.jsonEncode(source: r.data)));
      } else {
        return Either<TaskFailure, String>.left(TaskFailure.cast(expected: String, actual: r.data.runtimeType));
      }
    });
  }
}

extension TaskEitherMap on TaskEither<TaskFailure, Map<String, dynamic>> {
// Level: 4 - field
  TaskEither<TaskFailure, Map<String, dynamic>> safeMapField({required String field}) {
    return chainEither((r) {
      return r.lookup(field).toEither<TaskFailure>(() => TaskFailure.missingField(field: field));
    }).chainEither((r) {
      return Either<TaskFailure, dynamic>.fromNullable(r, () => TaskFailure.nullField(field: field));
    }).chainEither((r) {
      return Either<TaskFailure, Map<String, dynamic>>.safeCast(r, (r) => TaskFailure.cast(expected: Map<String, dynamic>, actual: r.runtimeType));
    });
  }

  TaskEither<TaskFailure, List<Map<String, dynamic>>> safeMapListField({required String field}) {
    return chainEither((r) {
      return r.lookup(field).toEither<TaskFailure>(() => TaskFailure.missingField(field: field));
    }).chainEither((r) {
      return Either<TaskFailure, dynamic>.fromNullable(r, () => TaskFailure.nullField(field: field));
    }).chainEither((r) {
      return Either<TaskFailure, List<dynamic>>.safeCast(r, (r) => TaskFailure.cast(expected: List<dynamic>, actual: r.runtimeType));
    }).chainEither((r) {
      return Either<TaskFailure, List<Map<String, dynamic>>>.tryCatch(() {
        return r.map((e) => e as Map<String, dynamic>).toList();
      }, (error, stackTrace) {
        return TaskFailure.cast(expected: List<Map<String, dynamic>>, actual: r.runtimeType);
      });
    });
  }

// Level: 5 - model
  TaskEither<TaskFailure, T> safeModel<T>(T Function(Map<String, dynamic> json) fromJson) => chainEither<T>((data) => Either<TaskFailure, T>.tryCatch(() {
        return fromJson(data);
      }, (error, stackTrace) {
        return TaskFailure.model(expected: T, error: error, stackTrace: stackTrace);
      }));
}

extension TaskEitherListMap on TaskEither<TaskFailure, List<Map<String, dynamic>>> {
  TaskEither<TaskFailure, List<T>> safeModel<T>(T Function(Map<String, dynamic> json) fromJson) =>
      chainEither<List<T>>((data) => Either<TaskFailure, List<T>>.tryCatch(() {
            return data.map((e) => fromJson(e)).toList();
          }, (error, stackTrace) {
            return TaskFailure.model(expected: T, error: error, stackTrace: stackTrace);
          }));
}
