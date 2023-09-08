part of 'book_info_bloc.dart';

@freezed
class BookInfoState with _$BookInfoState {
  const factory BookInfoState.loading() = _Loading;
  const factory BookInfoState.loadingError(String cause) = _LoadingError;
  const factory BookInfoState.loadingSuccess(BookHotel info) = _LoadedSuccess;
}
