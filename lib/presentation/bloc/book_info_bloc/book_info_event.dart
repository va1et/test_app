part of 'book_info_bloc.dart';

@freezed
class BookInfoEvent with _$BookInfoEvent {
  const factory BookInfoEvent.getBookInfo() = _GetBookInfo;
  const factory BookInfoEvent.addTourist(
      String phone, String email, List<Tourist> tourists) = _AddTourist;
}
