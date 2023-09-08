// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBookInfo,
    required TResult Function(
            String phone, String email, List<Tourist> tourists)
        addTourist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBookInfo,
    TResult? Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBookInfo,
    TResult Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBookInfo value) getBookInfo,
    required TResult Function(_AddTourist value) addTourist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBookInfo value)? getBookInfo,
    TResult? Function(_AddTourist value)? addTourist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBookInfo value)? getBookInfo,
    TResult Function(_AddTourist value)? addTourist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookInfoEventCopyWith<$Res> {
  factory $BookInfoEventCopyWith(
          BookInfoEvent value, $Res Function(BookInfoEvent) then) =
      _$BookInfoEventCopyWithImpl<$Res, BookInfoEvent>;
}

/// @nodoc
class _$BookInfoEventCopyWithImpl<$Res, $Val extends BookInfoEvent>
    implements $BookInfoEventCopyWith<$Res> {
  _$BookInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetBookInfoCopyWith<$Res> {
  factory _$$_GetBookInfoCopyWith(
          _$_GetBookInfo value, $Res Function(_$_GetBookInfo) then) =
      __$$_GetBookInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetBookInfoCopyWithImpl<$Res>
    extends _$BookInfoEventCopyWithImpl<$Res, _$_GetBookInfo>
    implements _$$_GetBookInfoCopyWith<$Res> {
  __$$_GetBookInfoCopyWithImpl(
      _$_GetBookInfo _value, $Res Function(_$_GetBookInfo) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetBookInfo implements _GetBookInfo {
  const _$_GetBookInfo();

  @override
  String toString() {
    return 'BookInfoEvent.getBookInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetBookInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBookInfo,
    required TResult Function(
            String phone, String email, List<Tourist> tourists)
        addTourist,
  }) {
    return getBookInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBookInfo,
    TResult? Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
  }) {
    return getBookInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBookInfo,
    TResult Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
    required TResult orElse(),
  }) {
    if (getBookInfo != null) {
      return getBookInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBookInfo value) getBookInfo,
    required TResult Function(_AddTourist value) addTourist,
  }) {
    return getBookInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBookInfo value)? getBookInfo,
    TResult? Function(_AddTourist value)? addTourist,
  }) {
    return getBookInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBookInfo value)? getBookInfo,
    TResult Function(_AddTourist value)? addTourist,
    required TResult orElse(),
  }) {
    if (getBookInfo != null) {
      return getBookInfo(this);
    }
    return orElse();
  }
}

abstract class _GetBookInfo implements BookInfoEvent {
  const factory _GetBookInfo() = _$_GetBookInfo;
}

/// @nodoc
abstract class _$$_AddTouristCopyWith<$Res> {
  factory _$$_AddTouristCopyWith(
          _$_AddTourist value, $Res Function(_$_AddTourist) then) =
      __$$_AddTouristCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone, String email, List<Tourist> tourists});
}

/// @nodoc
class __$$_AddTouristCopyWithImpl<$Res>
    extends _$BookInfoEventCopyWithImpl<$Res, _$_AddTourist>
    implements _$$_AddTouristCopyWith<$Res> {
  __$$_AddTouristCopyWithImpl(
      _$_AddTourist _value, $Res Function(_$_AddTourist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? email = null,
    Object? tourists = null,
  }) {
    return _then(_$_AddTourist(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == tourists
          ? _value._tourists
          : tourists // ignore: cast_nullable_to_non_nullable
              as List<Tourist>,
    ));
  }
}

/// @nodoc

class _$_AddTourist implements _AddTourist {
  const _$_AddTourist(this.phone, this.email, final List<Tourist> tourists)
      : _tourists = tourists;

  @override
  final String phone;
  @override
  final String email;
  final List<Tourist> _tourists;
  @override
  List<Tourist> get tourists {
    if (_tourists is EqualUnmodifiableListView) return _tourists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tourists);
  }

  @override
  String toString() {
    return 'BookInfoEvent.addTourist(phone: $phone, email: $email, tourists: $tourists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTourist &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._tourists, _tourists));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, email,
      const DeepCollectionEquality().hash(_tourists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddTouristCopyWith<_$_AddTourist> get copyWith =>
      __$$_AddTouristCopyWithImpl<_$_AddTourist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBookInfo,
    required TResult Function(
            String phone, String email, List<Tourist> tourists)
        addTourist,
  }) {
    return addTourist(phone, email, tourists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBookInfo,
    TResult? Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
  }) {
    return addTourist?.call(phone, email, tourists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBookInfo,
    TResult Function(String phone, String email, List<Tourist> tourists)?
        addTourist,
    required TResult orElse(),
  }) {
    if (addTourist != null) {
      return addTourist(phone, email, tourists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBookInfo value) getBookInfo,
    required TResult Function(_AddTourist value) addTourist,
  }) {
    return addTourist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBookInfo value)? getBookInfo,
    TResult? Function(_AddTourist value)? addTourist,
  }) {
    return addTourist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBookInfo value)? getBookInfo,
    TResult Function(_AddTourist value)? addTourist,
    required TResult orElse(),
  }) {
    if (addTourist != null) {
      return addTourist(this);
    }
    return orElse();
  }
}

abstract class _AddTourist implements BookInfoEvent {
  const factory _AddTourist(final String phone, final String email,
      final List<Tourist> tourists) = _$_AddTourist;

  String get phone;
  String get email;
  List<Tourist> get tourists;
  @JsonKey(ignore: true)
  _$$_AddTouristCopyWith<_$_AddTourist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String cause) loadingError,
    required TResult Function(BookHotel info) loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(BookHotel info)? loadingSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(BookHotel info)? loadingSuccess,
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
abstract class $BookInfoStateCopyWith<$Res> {
  factory $BookInfoStateCopyWith(
          BookInfoState value, $Res Function(BookInfoState) then) =
      _$BookInfoStateCopyWithImpl<$Res, BookInfoState>;
}

/// @nodoc
class _$BookInfoStateCopyWithImpl<$Res, $Val extends BookInfoState>
    implements $BookInfoStateCopyWith<$Res> {
  _$BookInfoStateCopyWithImpl(this._value, this._then);

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
    extends _$BookInfoStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'BookInfoState.loading()';
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
    required TResult Function(BookHotel info) loadingSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(BookHotel info)? loadingSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(BookHotel info)? loadingSuccess,
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

abstract class _Loading implements BookInfoState {
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
    extends _$BookInfoStateCopyWithImpl<$Res, _$_LoadingError>
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
    return 'BookInfoState.loadingError(cause: $cause)';
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
    required TResult Function(BookHotel info) loadingSuccess,
  }) {
    return loadingError(cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(BookHotel info)? loadingSuccess,
  }) {
    return loadingError?.call(cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(BookHotel info)? loadingSuccess,
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

abstract class _LoadingError implements BookInfoState {
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
  $Res call({BookHotel info});
}

/// @nodoc
class __$$_LoadedSuccessCopyWithImpl<$Res>
    extends _$BookInfoStateCopyWithImpl<$Res, _$_LoadedSuccess>
    implements _$$_LoadedSuccessCopyWith<$Res> {
  __$$_LoadedSuccessCopyWithImpl(
      _$_LoadedSuccess _value, $Res Function(_$_LoadedSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_LoadedSuccess(
      null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as BookHotel,
    ));
  }
}

/// @nodoc

class _$_LoadedSuccess implements _LoadedSuccess {
  const _$_LoadedSuccess(this.info);

  @override
  final BookHotel info;

  @override
  String toString() {
    return 'BookInfoState.loadingSuccess(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedSuccess &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

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
    required TResult Function(BookHotel info) loadingSuccess,
  }) {
    return loadingSuccess(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String cause)? loadingError,
    TResult? Function(BookHotel info)? loadingSuccess,
  }) {
    return loadingSuccess?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String cause)? loadingError,
    TResult Function(BookHotel info)? loadingSuccess,
    required TResult orElse(),
  }) {
    if (loadingSuccess != null) {
      return loadingSuccess(info);
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

abstract class _LoadedSuccess implements BookInfoState {
  const factory _LoadedSuccess(final BookHotel info) = _$_LoadedSuccess;

  BookHotel get info;
  @JsonKey(ignore: true)
  _$$_LoadedSuccessCopyWith<_$_LoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
