// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFailureCopyWith<$Res> {
  factory $TaskFailureCopyWith(
          TaskFailure value, $Res Function(TaskFailure) then) =
      _$TaskFailureCopyWithImpl<$Res, TaskFailure>;
}

/// @nodoc
class _$TaskFailureCopyWithImpl<$Res, $Val extends TaskFailure>
    implements $TaskFailureCopyWith<$Res> {
  _$TaskFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TaskFailureRequestCopyWith<$Res> {
  factory _$$TaskFailureRequestCopyWith(_$TaskFailureRequest value,
          $Res Function(_$TaskFailureRequest) then) =
      __$$TaskFailureRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({DioException exception});
}

/// @nodoc
class __$$TaskFailureRequestCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureRequest>
    implements _$$TaskFailureRequestCopyWith<$Res> {
  __$$TaskFailureRequestCopyWithImpl(
      _$TaskFailureRequest _value, $Res Function(_$TaskFailureRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$TaskFailureRequest(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DioException,
    ));
  }
}

/// @nodoc

class _$TaskFailureRequest implements TaskFailureRequest {
  _$TaskFailureRequest({required this.exception});

  @override
  final DioException exception;

  @override
  String toString() {
    return 'TaskFailure.request(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureRequest &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureRequestCopyWith<_$TaskFailureRequest> get copyWith =>
      __$$TaskFailureRequestCopyWithImpl<_$TaskFailureRequest>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return request(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return request?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class TaskFailureRequest implements TaskFailure {
  factory TaskFailureRequest({required final DioException exception}) =
      _$TaskFailureRequest;

  DioException get exception;
  @JsonKey(ignore: true)
  _$$TaskFailureRequestCopyWith<_$TaskFailureRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFailureStatusCodeCopyWith<$Res> {
  factory _$$TaskFailureStatusCodeCopyWith(_$TaskFailureStatusCode value,
          $Res Function(_$TaskFailureStatusCode) then) =
      __$$TaskFailureStatusCodeCopyWithImpl<$Res>;
  @useResult
  $Res call({int expected, int? actual});
}

/// @nodoc
class __$$TaskFailureStatusCodeCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureStatusCode>
    implements _$$TaskFailureStatusCodeCopyWith<$Res> {
  __$$TaskFailureStatusCodeCopyWithImpl(_$TaskFailureStatusCode _value,
      $Res Function(_$TaskFailureStatusCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expected = null,
    Object? actual = freezed,
  }) {
    return _then(_$TaskFailureStatusCode(
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      actual: freezed == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TaskFailureStatusCode implements TaskFailureStatusCode {
  _$TaskFailureStatusCode({required this.expected, this.actual});

  @override
  final int expected;
  @override
  final int? actual;

  @override
  String toString() {
    return 'TaskFailure.statusCode(expected: $expected, actual: $actual)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureStatusCode &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.actual, actual) || other.actual == actual));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expected, actual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureStatusCodeCopyWith<_$TaskFailureStatusCode> get copyWith =>
      __$$TaskFailureStatusCodeCopyWithImpl<_$TaskFailureStatusCode>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return statusCode(expected, actual);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return statusCode?.call(expected, actual);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (statusCode != null) {
      return statusCode(expected, actual);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return statusCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return statusCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (statusCode != null) {
      return statusCode(this);
    }
    return orElse();
  }
}

abstract class TaskFailureStatusCode implements TaskFailure {
  factory TaskFailureStatusCode(
      {required final int expected,
      final int? actual}) = _$TaskFailureStatusCode;

  int get expected;
  int? get actual;
  @JsonKey(ignore: true)
  _$$TaskFailureStatusCodeCopyWith<_$TaskFailureStatusCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFailureCastCopyWith<$Res> {
  factory _$$TaskFailureCastCopyWith(
          _$TaskFailureCast value, $Res Function(_$TaskFailureCast) then) =
      __$$TaskFailureCastCopyWithImpl<$Res>;
  @useResult
  $Res call({Type expected, Type actual});
}

/// @nodoc
class __$$TaskFailureCastCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureCast>
    implements _$$TaskFailureCastCopyWith<$Res> {
  __$$TaskFailureCastCopyWithImpl(
      _$TaskFailureCast _value, $Res Function(_$TaskFailureCast) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expected = null,
    Object? actual = null,
  }) {
    return _then(_$TaskFailureCast(
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as Type,
      actual: null == actual
          ? _value.actual
          : actual // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$TaskFailureCast implements TaskFailureCast {
  _$TaskFailureCast({required this.expected, required this.actual});

  @override
  final Type expected;
  @override
  final Type actual;

  @override
  String toString() {
    return 'TaskFailure.cast(expected: $expected, actual: $actual)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureCast &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.actual, actual) || other.actual == actual));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expected, actual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureCastCopyWith<_$TaskFailureCast> get copyWith =>
      __$$TaskFailureCastCopyWithImpl<_$TaskFailureCast>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return cast(expected, actual);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return cast?.call(expected, actual);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (cast != null) {
      return cast(expected, actual);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return cast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return cast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (cast != null) {
      return cast(this);
    }
    return orElse();
  }
}

abstract class TaskFailureCast implements TaskFailure {
  factory TaskFailureCast(
      {required final Type expected,
      required final Type actual}) = _$TaskFailureCast;

  Type get expected;
  Type get actual;
  @JsonKey(ignore: true)
  _$$TaskFailureCastCopyWith<_$TaskFailureCast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFailureJsonDecodeCopyWith<$Res> {
  factory _$$TaskFailureJsonDecodeCopyWith(_$TaskFailureJsonDecode value,
          $Res Function(_$TaskFailureJsonDecode) then) =
      __$$TaskFailureJsonDecodeCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic source});
}

/// @nodoc
class __$$TaskFailureJsonDecodeCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureJsonDecode>
    implements _$$TaskFailureJsonDecodeCopyWith<$Res> {
  __$$TaskFailureJsonDecodeCopyWithImpl(_$TaskFailureJsonDecode _value,
      $Res Function(_$TaskFailureJsonDecode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
  }) {
    return _then(_$TaskFailureJsonDecode(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$TaskFailureJsonDecode implements TaskFailureJsonDecode {
  _$TaskFailureJsonDecode({required this.source});

  @override
  final dynamic source;

  @override
  String toString() {
    return 'TaskFailure.jsonDecode(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureJsonDecode &&
            const DeepCollectionEquality().equals(other.source, source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(source));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureJsonDecodeCopyWith<_$TaskFailureJsonDecode> get copyWith =>
      __$$TaskFailureJsonDecodeCopyWithImpl<_$TaskFailureJsonDecode>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return jsonDecode(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return jsonDecode?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (jsonDecode != null) {
      return jsonDecode(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return jsonDecode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return jsonDecode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (jsonDecode != null) {
      return jsonDecode(this);
    }
    return orElse();
  }
}

abstract class TaskFailureJsonDecode implements TaskFailure {
  factory TaskFailureJsonDecode({required final dynamic source}) =
      _$TaskFailureJsonDecode;

  dynamic get source;
  @JsonKey(ignore: true)
  _$$TaskFailureJsonDecodeCopyWith<_$TaskFailureJsonDecode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFailureModelCopyWith<$Res> {
  factory _$$TaskFailureModelCopyWith(
          _$TaskFailureModel value, $Res Function(_$TaskFailureModel) then) =
      __$$TaskFailureModelCopyWithImpl<$Res>;
  @useResult
  $Res call({Type expected});
}

/// @nodoc
class __$$TaskFailureModelCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureModel>
    implements _$$TaskFailureModelCopyWith<$Res> {
  __$$TaskFailureModelCopyWithImpl(
      _$TaskFailureModel _value, $Res Function(_$TaskFailureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expected = null,
  }) {
    return _then(_$TaskFailureModel(
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$TaskFailureModel implements TaskFailureModel {
  _$TaskFailureModel({required this.expected});

  @override
  final Type expected;

  @override
  String toString() {
    return 'TaskFailure.model(expected: $expected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureModel &&
            (identical(other.expected, expected) ||
                other.expected == expected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureModelCopyWith<_$TaskFailureModel> get copyWith =>
      __$$TaskFailureModelCopyWithImpl<_$TaskFailureModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return model(expected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return model?.call(expected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(expected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }
}

abstract class TaskFailureModel implements TaskFailure {
  factory TaskFailureModel({required final Type expected}) = _$TaskFailureModel;

  Type get expected;
  @JsonKey(ignore: true)
  _$$TaskFailureModelCopyWith<_$TaskFailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFailureMissingFieldCopyWith<$Res> {
  factory _$$TaskFailureMissingFieldCopyWith(_$TaskFailureMissingField value,
          $Res Function(_$TaskFailureMissingField) then) =
      __$$TaskFailureMissingFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({String field});
}

/// @nodoc
class __$$TaskFailureMissingFieldCopyWithImpl<$Res>
    extends _$TaskFailureCopyWithImpl<$Res, _$TaskFailureMissingField>
    implements _$$TaskFailureMissingFieldCopyWith<$Res> {
  __$$TaskFailureMissingFieldCopyWithImpl(_$TaskFailureMissingField _value,
      $Res Function(_$TaskFailureMissingField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
  }) {
    return _then(_$TaskFailureMissingField(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskFailureMissingField implements TaskFailureMissingField {
  _$TaskFailureMissingField({required this.field});

  @override
  final String field;

  @override
  String toString() {
    return 'TaskFailure.missingField(field: $field)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFailureMissingField &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFailureMissingFieldCopyWith<_$TaskFailureMissingField> get copyWith =>
      __$$TaskFailureMissingFieldCopyWithImpl<_$TaskFailureMissingField>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioException exception) request,
    required TResult Function(int expected, int? actual) statusCode,
    required TResult Function(Type expected, Type actual) cast,
    required TResult Function(dynamic source) jsonDecode,
    required TResult Function(Type expected) model,
    required TResult Function(String field) missingField,
  }) {
    return missingField(field);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioException exception)? request,
    TResult? Function(int expected, int? actual)? statusCode,
    TResult? Function(Type expected, Type actual)? cast,
    TResult? Function(dynamic source)? jsonDecode,
    TResult? Function(Type expected)? model,
    TResult? Function(String field)? missingField,
  }) {
    return missingField?.call(field);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioException exception)? request,
    TResult Function(int expected, int? actual)? statusCode,
    TResult Function(Type expected, Type actual)? cast,
    TResult Function(dynamic source)? jsonDecode,
    TResult Function(Type expected)? model,
    TResult Function(String field)? missingField,
    required TResult orElse(),
  }) {
    if (missingField != null) {
      return missingField(field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFailureRequest value) request,
    required TResult Function(TaskFailureStatusCode value) statusCode,
    required TResult Function(TaskFailureCast value) cast,
    required TResult Function(TaskFailureJsonDecode value) jsonDecode,
    required TResult Function(TaskFailureModel value) model,
    required TResult Function(TaskFailureMissingField value) missingField,
  }) {
    return missingField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFailureRequest value)? request,
    TResult? Function(TaskFailureStatusCode value)? statusCode,
    TResult? Function(TaskFailureCast value)? cast,
    TResult? Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult? Function(TaskFailureModel value)? model,
    TResult? Function(TaskFailureMissingField value)? missingField,
  }) {
    return missingField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFailureRequest value)? request,
    TResult Function(TaskFailureStatusCode value)? statusCode,
    TResult Function(TaskFailureCast value)? cast,
    TResult Function(TaskFailureJsonDecode value)? jsonDecode,
    TResult Function(TaskFailureModel value)? model,
    TResult Function(TaskFailureMissingField value)? missingField,
    required TResult orElse(),
  }) {
    if (missingField != null) {
      return missingField(this);
    }
    return orElse();
  }
}

abstract class TaskFailureMissingField implements TaskFailure {
  factory TaskFailureMissingField({required final String field}) =
      _$TaskFailureMissingField;

  String get field;
  @JsonKey(ignore: true)
  _$$TaskFailureMissingFieldCopyWith<_$TaskFailureMissingField> get copyWith =>
      throw _privateConstructorUsedError;
}
