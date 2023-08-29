import 'dart:convert';
import 'dart:io';

import 'package:depths/depths.dart';
import 'package:depths/failures/task_failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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

  dioAdapter
    ..onGet('statusCode=200', (server) => server.reply(200, {}))
    ..onGet('statusCode=201', (server) => server.reply(201, {}))
    ..onGet('statusCode=500', (server) => server.reply(500, {}))
    ..onGet('response=map', (server) => server.reply(200, {'id': 1, 'name': 'John Doe'}))
    ..onGet('response=plain', (server) => server.reply(200, '{"id": 1, "name": "John Doe"}'))
    ..onGet('response=empty-list', (server) => server.reply(200, []))
    ..onGet(
        'response=list',
        (server) => server.reply(200, [
              {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
            ]))
    ..onGet('response=map&model=todo', (server) => server.reply(200, {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}))
    ..onGet('response=plain&model=todo', (server) => server.reply(200, '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'))
    ..onGet('response=map&field=error', (server) => server.reply(200, {'error': {}}))
    ..onGet(
        'response=map&field=data&model=todo',
        (server) => server.reply(200, {
              'data': {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}
            }));

  test('safeRequest', () async {
    final either = await dio.get('statusCode=500').safeRequest().run();
    either.fold((l) => expect(l is TaskFailureRequest, true), (r) => fail(r.toString()));
  });

  test('safeStatusCode', () async {
    final either = await dio.get('statusCode=201').safeRequest().safeStatusCode(expectedStatusCode: HttpStatus.ok).run();
    either.fold((l) => expect(l is TaskFailureStatusCode, true), (r) => fail(r.toString()));
  });

  test('safeResponseDataMapCast', () async {
    final either = await dio.get('response=plain').safeRequest().safeMapCast().run();
    either.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));

    final either2 = await dio.get('response=map').safeRequest().safeMapCast().run();
    either2.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));

    final either3 = await dio.get('response=empty-list').safeRequest().safeMapCast().run();
    either3.fold((l) {
      expect(l is TaskFailureCast, true);
    }, (r) => fail(r.toString()));

    final either4 = await dio.get('response=list').safeRequest().safeListMapCast().run();
    either4.fold((l) => fail(l.toString()), (r) => expect(r is List<Map<String, dynamic>>, true));
  });

  test('safeLookupMapField', () async {
    final either = await dio.get('response=map&field=error').safeRequest().safeMapCast().safeExistField(field: 'data').run();
    either.fold((l) => expect(l is TaskFailureMissingField, true), (r) => fail(r.toString()));

    final either2 = await dio.get('response=map&field=error').safeRequest().safeMapCast().safeExistField(field: 'error').run();
    either2.fold((l) => fail(l.toString()), (r) => expect(r is Map<String, dynamic>, true));
  });

  test('safeModelFromJson', () async {
    final either = await dio
        .get("response=map&field=data&model=todo")
        .safeRequest()
        .safeMapCast()
        .safeExistField(field: 'data')
        .safeModel((json) => Todo.fromJsonWithError(json))
        .run();
    either.fold((l) => expect(l is TaskFailureModel, true), (r) => fail(r.toString()));

    final either2 = await dio
        .get("response=map&field=data&model=todo")
        .safeRequest()
        .safeMapCast()
        .safeExistField(field: 'data')
        .safeModel((json) => Todo.fromJson(json))
        .run();
    either2.fold((l) => fail(l.toString()), (r) => expect(r is Todo, true));
  });
}
