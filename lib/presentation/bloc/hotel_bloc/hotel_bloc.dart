import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app_effective/domain/models/hotel.dart';
import 'package:test_app_effective/domain/usecases/get_hotel.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';
part 'hotel_bloc.freezed.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final GetHotel getHotel;

  HotelBloc({required this.getHotel}) : super(const _Loading()) {
    on<_GetHotel>(_onGetHotel);
  }

  void _onGetHotel(
    _GetHotel event,
    Emitter<HotelState> emit,
  ) async {
    emit(const _Loading());
    final hotel = await getHotel();

    await hotel.fold((failure) async {
      emit(const _LoadingError(
        '',
      ));
    }, (hotelRemote) async {
      emit(_LoadedSuccess(hotelRemote));
    });
  }
}
