// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app_effective/domain/models/book_hotel.dart';
import 'package:test_app_effective/domain/models/tourist.dart';
import 'package:test_app_effective/domain/usecases/get_book_info.dart';

part 'book_info_event.dart';
part 'book_info_state.dart';

part 'book_info_bloc.freezed.dart';

class BookInfoBloc extends Bloc<BookInfoEvent, BookInfoState> {
  final GetBookInfo getBookInfo;
  static List<Tourist> touristscache = [];

  BookInfoBloc({required this.getBookInfo}) : super(const _Loading()) {
    on<_GetBookInfo>(_onGetBookInfo);
    on<_AddTourist>(_addTouist);
  }

  void _onGetBookInfo(
    _GetBookInfo event,
    Emitter<BookInfoState> emit,
  ) async {
    emit(const _Loading());
    final info = await getBookInfo();

    await info.fold((failure) async {
      emit(const _LoadingError(
        '',
      ));
    }, (infoRemote) async {
      emit(_LoadedSuccess(infoRemote));
    });
  }

  void _addTouist(
    _AddTourist event,
    Emitter<BookInfoState> emit,
  ) {}
}
