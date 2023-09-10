part of depths;

extension FutureTaskEither on Future<Response> {
  // Level: 1 - request
  TaskEither<TaskFailure, Response<dynamic>> safeRequest() =>
      TaskEither<TaskFailure, Response<dynamic>>.tryCatch(() => this, (error, stackTrace) => TaskFailure.request(exception: error as DioException));
}

extension TaskEitherResponse on TaskEither<TaskFailure, Response> {
  // Level: 2 - statusCode
  TaskEither<TaskFailure, Response> safeStatusCode({int? expect}) => chainEither<Response>((r) => Either<TaskFailure, Response>.fromPredicate(
      r, (r) => r.statusCode == (expect ?? HttpStatus.ok), (r) => TaskFailure.statusCode(expected: (expect ?? HttpStatus.ok), actual: r.statusCode)));

  // Level: 3 - response data
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

extension TaskEitherEmitter<T> on TaskEither<TaskFailure, T> {
  Emitter<Either<TaskFailure, T>> emitter({String? name, bool keepAlive = false, List<Object?>? args}) {
    return Emitter(
      (ref, emit) async {
        final result = await run();
        emit(result);
      },
      name: name,
      keepAlive: keepAlive,
      args: args,
    );
  }
}
