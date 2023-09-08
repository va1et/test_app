part of 'rooms_bloc.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState.loading() = _Loading;
  const factory RoomsState.loadingError(String cause) = _LoadingError;
  const factory RoomsState.loadingSuccess(List<Room> rooms) = _LoadedSuccess;
}
