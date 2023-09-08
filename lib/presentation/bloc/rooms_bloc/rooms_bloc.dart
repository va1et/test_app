// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app_effective/common/errors/failures.dart';
import 'package:test_app_effective/domain/models/rooms.dart';
import 'package:test_app_effective/domain/usecases/get_rooms.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

part 'rooms_bloc.freezed.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final GetRooms getRooms;
  static List<Room> roomscache = [];

  RoomsBloc({required this.getRooms}) : super(const _Loading()) {
    on<_GetRooms>(_onGetRooms);
  }

  void _onGetRooms(
    _GetRooms event,
    Emitter<RoomsState> emit,
  ) async {
    if (roomscache.isEmpty) {
      emit(const _Loading());
    } else if (roomscache.isNotEmpty) {
      _LoadedSuccess(roomscache);
    }

    final rooms = await getRooms();

    await rooms.fold((failure) async {
      emit(const _LoadingError(
        '',
      ));
    }, (roomsRemote) async {
      roomscache = roomsRemote.rooms;
      emit(_LoadedSuccess(roomscache));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Произошла ошибка при загрузке данных. Пожалуйста, проверьте ваше интернет-соединение';
      case CacheFailure:
        return 'Произошла ошибка при загрузке данных';
      default:
        return 'Unexpected Error';
    }
  }
}
