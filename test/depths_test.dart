// ignore_for_file: unnecessary_type_check

import 'package:depths/depths.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class Todo {
  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool,
      );

  factory Todo.fromJsonWithError(Map<String, dynamic> json) => Todo(
        userId: json['userIdx'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool,
      );
}

void main() async {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  group('safeRequest', () {
    test('fail request with 500', () async {
      dioAdapter.onGet('statusCode=500', (server) => server.reply(500, {}));
      final either = await dio.get('statusCode=500').safeRequest().run();
      either.fold((l) => expect(l is TaskFailureRequest, true), (r) => fail(r.toString()));
    });

    test('successful request with 200', () async {
      dioAdapter.onGet('statusCode=200', (server) => server.reply(200, {}));
      final either = await dio.get('statusCode=200').safeRequest().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Response, true));
    });

    test('fail request with 404', () async {
      dioAdapter.onGet('statusCode=404', (server) => server.reply(404, {}));
      final either = await dio.get('statusCode=404').safeRequest().run();
      either.fold((l) => expect(l is TaskFailureRequest, true), (r) => fail(r.toString()));
    });

    test('fail request with 400', () async {
      dioAdapter.onGet('statusCode=400', (server) => server.reply(400, {}));
      final either = await dio.get('statusCode=400').safeRequest().run();
      either.fold((l) => expect(l is TaskFailureRequest, true), (r) => fail(r.toString()));
    });

    test('fail request with 401', () async {
      dioAdapter.onGet('statusCode=401', (server) => server.reply(401, {}));
      final either = await dio.get('statusCode=401').safeRequest().run();
      either.fold((l) => expect(l is TaskFailureRequest, true), (r) => fail(r.toString()));
    });
  });

  /// after safe request success
  group('safeStatusCode', () {
    test('expected 200, actual 201', () async {
      dioAdapter.onGet('statusCode=201', (server) => server.reply(201, {}));
      final either = await dio.get('statusCode=201').safeRequest().safeStatusCodes(expect: [200]).run();
      either.fold((l) => expect(l is TaskFailureStatusCode, true), (r) => fail(r.toString()));
    });

    test('expected 200, actual 200', () async {
      dioAdapter.onGet('statusCode=200', (server) => server.reply(200, {}));
      final either = await dio.get('statusCode=200').safeRequest().safeStatusCodes(expect: [200]).run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Response, true));
    });
  });

  group('safeResponseDataMapCast', () {
    test('string response successful', () async {
      dioAdapter.onGet('response=plain', (server) => server.reply(200, '{"id": 1, "name": "John Doe"}'));
      final either = await dio.get('response=plain').safeRequest().safeCastMap().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });

    test('map response successful', () async {
      dioAdapter.onGet('response=map', (server) => server.reply(200, {'id': 1, 'name': 'John Doe'}));
      final either = await dio.get('response=map').safeRequest().safeCastMap().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });

    test('map response with null field successful', () async {
      dioAdapter.onGet('response=map-null', (server) => server.reply(200, {'id': 1, 'name': null}));
      final either = await dio.get('response=map-null').safeRequest().safeCastMap().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });

    test('empty list response fail', () async {
      dioAdapter.onGet('response=empty-list', (server) => server.reply(200, []));
      final either = await dio.get('response=empty-list').safeRequest().safeCastMap().run();
      either.fold((l) => expect(l is TaskFailureCast, true), (r) => fail(r.toString()));
    });

    test('list response fail', () async {
      dioAdapter.onGet(
          'response=list',
          (server) => server.reply(200, [
                {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
              ]));
      final either = await dio.get('response=list').safeRequest().safeCastMap().run();
      either.fold((l) => expect(l is TaskFailureCast, true), (r) => fail(r.toString()));
    });

    test('empty map response successful', () async {
      dioAdapter.onGet('response=empty-map', (server) => server.reply(200, {}));
      final either = await dio.get('response=empty-map').safeRequest().safeCastMap().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });

    test('null response fail', () async {
      dioAdapter.onGet('response=null', (server) => server.reply(200, null));
      final either = await dio.get('response=null').safeRequest().safeCastMap().run();
      either.fold((l) => expect(l is TaskFailureCast, true), (r) => fail(r.toString()));
    });

    test('empty string response fail', () async {
      dioAdapter.onGet('response=empty-string', (server) => server.reply(200, ''));
      final either = await dio.get('response=empty-string').safeRequest().safeCastMap().run();
      either.fold((l) => expect(l is TaskFailureJsonDecode, true), (r) => fail(r.toString()));
    });

    test('null string response fail', () async {
      dioAdapter.onGet('response=null-string', (server) => server.reply(200, 'null'));
      final either = await dio.get('response=null-string').safeRequest().safeCastMap().run();
      either.fold((l) => expect(l is TaskFailureJsonDecode, true), (r) => fail(r.toString()));
    });

    test('empty map response successful', () async {
      dioAdapter.onGet('response=empty-map', (server) => server.reply(200, {}));
      final either = await dio.get('response=empty-map').safeRequest().safeCastMap().run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });
  });

  group('safeLookupMapField', () {
    test('data field missing', () async {
      dioAdapter.onGet(
          'response=map&field=error',
          (server) => server.reply(200, {
                'error': {'code': 404, 'message': 'Not Found'}
              }));
      final either = await dio.get('response=map&field=error').safeRequest().safeCastMap().safeMapField(field: 'data').run();
      either.fold((l) => expect(l is TaskFailureMissingField, true), (r) => fail(r.toString()));
    });

    test('data field successful', () async {
      dioAdapter.onGet(
          'response=map&field=error',
          (server) => server.reply(200, {
                'data': {
                  'isAlive': true,
                },
                'error': null,
              }));
      final either = await dio.get('response=map&field=error').safeRequest().safeCastMap().safeMapField(field: 'data').run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
    });

    test('null data field fail', () async {
      dioAdapter.onGet(
          'response=map&field=error',
          (server) => server.reply(200, {
                'data': null,
                'error': 'error message',
              }));
      final either = await dio.get('response=map&field=error').safeRequest().safeCastMap().safeMapField(field: 'data').run();
      either.fold((l) => expect(l is TaskFailureNullField, true), (r) => fail(r.toString()));
    });

    test('empty data field fail', () async {
      dioAdapter.onGet(
          'response=map&field=error',
          (server) => server.reply(200, {
                'data': '',
                'error': 'error message',
              }));
      final either = await dio.get('response=map&field=error').safeRequest().safeCastMap().safeMapField(field: 'data').run();
      either.fold((l) => expect(l is TaskFailureCast, true), (r) => fail(r.toString()));
    });
  });

  group('safeModelFromJson', () {
    test('left', () async {
      dioAdapter.onGet(
          'response=map&field=data&model=todo',
          (server) => server.reply(200, {
                'data': {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
              }));
      final either = await dio
          .get("response=map&field=data&model=todo")
          .safeRequest()
          .safeCastMap()
          .safeMapField(field: 'data')
          .safeModel((json) => Todo.fromJsonWithError(json))
          .run();
      either.fold((l) => expect(l is TaskFailureModel, true), (r) => fail(r.toString()));
    });

    test('right', () async {
      dioAdapter.onGet(
          'response=map&field=data&model=todo',
          (server) => server.reply(200, {
                'data': {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
              }));
      final either = await dio
          .get("response=map&field=data&model=todo")
          .safeRequest()
          .safeCastMap()
          .safeMapField(field: 'data')
          .safeModel((json) => Todo.fromJson(json))
          .run();
      either.fold((l) => fail(l.toString()), (r) => expect(r is Todo, true));
    });
  });
}
