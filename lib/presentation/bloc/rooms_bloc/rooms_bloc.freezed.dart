// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rooms_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRooms value) getRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRooms value)? getRooms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRooms value)? getRooms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsEventCopyWith<$Res> {
  factory $RoomsEventCopyWith(
          RoomsEvent value, $Res Function(RoomsEvent) then) =
      _$RoomsEventCopyWithImpl<$Res, RoomsEvent>;
}

/// @nodoc
class _$RoomsEventCopyWithImpl<$Res, $Val extends RoomsEvent>
    implements $RoomsEventCopyWith<$Res> {
  _$RoomsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetRoomsCopyWith<$Res> {
  factory _$$_GetRoomsCopyWith(
          _$_GetRooms value, $Res Function(_$_GetRooms) then) =
      __$$_GetRoomsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetRoomsCopyWithImpl<$Res>
    extends _$RoomsEventCopyWithImpl<$Res, _$_GetRooms>
    implements _$$_GetRoomsCopyWith<$Res> {
  __$$_GetRoomsCopyWithImpl(
      _$_GetRooms _value, $Res Function(_$_GetRooms) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetRooms implements _GetRooms {
  const _$_GetRooms();

  @override
  String toString() {
    return 'RoomsEvent.getRooms()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetRooms);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRooms,
  }) {
    return getRooms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getRooms,
  }) {
    return getRooms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRooms,
    required TResult orElse(),
  }) {
    if (getRooms != null) {
      return getRooms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRooms value) getRooms,
  }) {
    return getRooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRooms value)? getRooms,
  }) {
    return getRooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRooms value)? getRooms,
    required TResult orElse(),
  }) {
    if (getRooms != null) {
      return getRooms(this);
    }
    return orElse();
  }
}

abstract class _GetRooms implements RoomsEvent {
  const factory _GetRooms() = _$_GetRooms;
}

/// @nodoc
mixin _$RoomsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(List<Room> rooms) loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(List<Room> rooms)? loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(List<Room> rooms)? loadingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingError value) loadingError,
    required TResult Function(_LoadedSuccess value) loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingError value)? loadingError,
    TResult? Function(_LoadedSuccess value)? loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingError value)? loadingError,
    TResult Function(_LoadedSuccess value)? loadingSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomsStateCopyWith<$Res> {
  factory $RoomsStateCopyWith(
          RoomsState value, $Res Function(RoomsState) then) =
      _$RoomsStateCopyWithImpl<$Res, RoomsState>;
}

/// @nodoc
class _$RoomsStateCopyWithImpl<$Res, $Val extends RoomsState>
    implements $RoomsStateCopyWith<$Res> {
  _$RoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$RoomsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'RoomsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(List<Room> rooms) loadingSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(List<Room> rooms)? loadingSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(List<Room> rooms)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingError value) loadingError,
    required TResult Function(_LoadedSuccess value) loadingSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingError value)? loadingError,
    TResult? Function(_LoadedSuccess value)? loadingSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingError value)? loadingError,
    TResult Function(_LoadedSuccess value)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RoomsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadingErrorCopyWith<$Res> {
  factory _$$_LoadingErrorCopyWith(
          _$_LoadingError value, $Res Function(_$_LoadingError) then) =
      __$$_LoadingErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String cause});
}

/// @nodoc
class __$$_LoadingErrorCopyWithImpl<$Res>
    extends _$RoomsStateCopyWithImpl<$Res, _$_LoadingError>
    implements _$$_LoadingErrorCopyWith<$Res> {
  __$$_LoadingErrorCopyWithImpl(
      _$_LoadingError _value, $Res Function(_$_LoadingError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cause = null,
  }) {
    return _then(_$_LoadingError(
      null == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadingError implements _LoadingError {
  const _$_LoadingError(this.cause);

  @override
  final String cause;

  @override
  String toString() {
    return 'RoomsState.loadingError(cause: $cause)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingError &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingErrorCopyWith<_$_LoadingError> get copyWith =>
      __$$_LoadingErrorCopyWithImpl<_$_LoadingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(List<Room> rooms) loadingSuccess,
  }) {
    return loadingError(cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(List<Room> rooms)? loadingSuccess,
  }) {
    return loadingError?.call(cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(List<Room> rooms)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingError != null) {
      return loadingError(cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingError value) loadingError,
    required TResult Function(_LoadedSuccess value) loadingSuccess,
  }) {
    return loadingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingError value)? loadingError,
    TResult? Function(_LoadedSuccess value)? loadingSuccess,
  }) {
    return loadingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingError value)? loadingError,
    TResult Function(_LoadedSuccess value)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingError != null) {
      return loadingError(this);
    }
    return orElse();
  }
}

abstract class _LoadingError implements RoomsState {
  const factory _LoadingError(final String cause) = _$_LoadingError;

  String get cause;
  @JsonKey(ignore: true)
  _$$_LoadingErrorCopyWith<_$_LoadingError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedSuccessCopyWith<$Res> {
  factory _$$_LoadedSuccessCopyWith(
          _$_LoadedSuccess value, $Res Function(_$_LoadedSuccess) then) =
      __$$_LoadedSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Room> rooms});
}

/// @nodoc
class __$$_LoadedSuccessCopyWithImpl<$Res>
    extends _$RoomsStateCopyWithImpl<$Res, _$_LoadedSuccess>
    implements _$$_LoadedSuccessCopyWith<$Res> {
  __$$_LoadedSuccessCopyWithImpl(
      _$_LoadedSuccess _value, $Res Function(_$_LoadedSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_$_LoadedSuccess(
      null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ));
  }
}

/// @nodoc

class _$_LoadedSuccess implements _LoadedSuccess {
  const _$_LoadedSuccess(final List<Room> rooms) : _rooms = rooms;

  final List<Room> _rooms;
  @override
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'RoomsState.loadingSuccess(rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedSuccess &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedSuccessCopyWith<_$_LoadedSuccess> get copyWith =>
      __$$_LoadedSuccessCopyWithImpl<_$_LoadedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(List<Room> rooms) loadingSuccess,
  }) {
    return loadingSuccess(rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(List<Room> rooms)? loadingSuccess,
  }) {
    return loadingSuccess?.call(rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(List<Room> rooms)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingError value) loadingError,
    required TResult Function(_LoadedSuccess value) loadingSuccess,
  }) {
    return loadingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingError value)? loadingError,
    TResult? Function(_LoadedSuccess value)? loadingSuccess,
  }) {
    return loadingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingError value)? loadingError,
    TResult Function(_LoadedSuccess value)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadedSuccess implements RoomsState {
  const factory _LoadedSuccess(final List<Room> rooms) = _$_LoadedSuccess;

  List<Room> get rooms;
  @JsonKey(ignore: true)
  _$$_LoadedSuccessCopyWith<_$_LoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
