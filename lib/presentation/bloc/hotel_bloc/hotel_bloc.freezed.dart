// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HotelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHotel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHotel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHotel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHotel value) getHotel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHotel value)? getHotel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHotel value)? getHotel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelEventCopyWith<$Res> {
  factory $HotelEventCopyWith(
          HotelEvent value, $Res Function(HotelEvent) then) =
      _$HotelEventCopyWithImpl<$Res, HotelEvent>;
}

/// @nodoc
class _$HotelEventCopyWithImpl<$Res, $Val extends HotelEvent>
    implements $HotelEventCopyWith<$Res> {
  _$HotelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetHotelCopyWith<$Res> {
  factory _$$_GetHotelCopyWith(
          _$_GetHotel value, $Res Function(_$_GetHotel) then) =
      __$$_GetHotelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetHotelCopyWithImpl<$Res>
    extends _$HotelEventCopyWithImpl<$Res, _$_GetHotel>
    implements _$$_GetHotelCopyWith<$Res> {
  __$$_GetHotelCopyWithImpl(
      _$_GetHotel _value, $Res Function(_$_GetHotel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetHotel implements _GetHotel {
  const _$_GetHotel();

  @override
  String toString() {
    return 'HotelEvent.getHotel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetHotel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHotel,
  }) {
    return getHotel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHotel,
  }) {
    return getHotel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHotel,
    required TResult orElse(),
  }) {
    if (getHotel != null) {
      return getHotel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHotel value) getHotel,
  }) {
    return getHotel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHotel value)? getHotel,
  }) {
    return getHotel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHotel value)? getHotel,
    required TResult orElse(),
  }) {
    if (getHotel != null) {
      return getHotel(this);
    }
    return orElse();
  }
}

abstract class _GetHotel implements HotelEvent {
  const factory _GetHotel() = _$_GetHotel;
}

/// @nodoc
mixin _$HotelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(Hotel hotel) loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(Hotel hotel)? loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(Hotel hotel)? loadingSuccess,
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
abstract class $HotelStateCopyWith<$Res> {
  factory $HotelStateCopyWith(
          HotelState value, $Res Function(HotelState) then) =
      _$HotelStateCopyWithImpl<$Res, HotelState>;
}

/// @nodoc
class _$HotelStateCopyWithImpl<$Res, $Val extends HotelState>
    implements $HotelStateCopyWith<$Res> {
  _$HotelStateCopyWithImpl(this._value, this._then);

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
    extends _$HotelStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'HotelState.loading()';
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
    required TResult Function(Hotel hotel) loadingSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(Hotel hotel)? loadingSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(Hotel hotel)? loadingSuccess,
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

abstract class _Loading implements HotelState {
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
    extends _$HotelStateCopyWithImpl<$Res, _$_LoadingError>
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
    return 'HotelState.loadingError(cause: $cause)';
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
    required TResult Function(Hotel hotel) loadingSuccess,
  }) {
    return loadingError(cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(Hotel hotel)? loadingSuccess,
  }) {
    return loadingError?.call(cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(Hotel hotel)? loadingSuccess,
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

abstract class _LoadingError implements HotelState {
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
  $Res call({Hotel hotel});
}

/// @nodoc
class __$$_LoadedSuccessCopyWithImpl<$Res>
    extends _$HotelStateCopyWithImpl<$Res, _$_LoadedSuccess>
    implements _$$_LoadedSuccessCopyWith<$Res> {
  __$$_LoadedSuccessCopyWithImpl(
      _$_LoadedSuccess _value, $Res Function(_$_LoadedSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotel = null,
  }) {
    return _then(_$_LoadedSuccess(
      null == hotel
          ? _value.hotel
          : hotel // ignore: cast_nullable_to_non_nullable
              as Hotel,
    ));
  }
}

/// @nodoc

class _$_LoadedSuccess implements _LoadedSuccess {
  const _$_LoadedSuccess(this.hotel);

  @override
  final Hotel hotel;

  @override
  String toString() {
    return 'HotelState.loadingSuccess(hotel: $hotel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedSuccess &&
            (identical(other.hotel, hotel) || other.hotel == hotel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hotel);

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
    required TResult Function(Hotel hotel) loadingSuccess,
  }) {
    return loadingSuccess(hotel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(Hotel hotel)? loadingSuccess,
  }) {
    return loadingSuccess?.call(hotel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(Hotel hotel)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(hotel);
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

abstract class _LoadedSuccess implements HotelState {
  const factory _LoadedSuccess(final Hotel hotel) = _$_LoadedSuccess;

  Hotel get hotel;
  @JsonKey(ignore: true)
  _$$_LoadedSuccessCopyWith<_$_LoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
