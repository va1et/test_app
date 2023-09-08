part of 'hotel_bloc.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState.loading() = _Loading;
  const factory HotelState.loadingError(String cause) = _LoadingError;
  const factory HotelState.loadingSuccess(Hotel hotel) = _LoadedSuccess;
}
