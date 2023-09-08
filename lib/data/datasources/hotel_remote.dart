import 'package:dio/dio.dart';
import 'package:test_app_effective/common/errors/exceptions.dart';
import 'package:test_app_effective/data/models/book_hotel_modal.dart';
import 'package:test_app_effective/data/models/hotel_modal.dart';
import 'package:test_app_effective/data/models/room_model.dart';

abstract class HotelRemoteData {
  Future<HotelModel> getHotel();

  Future<RoomsModel> getRooms();
  Future<BookHotelModel> getBookHotel();
}

class HotelRemoteDataImpl implements HotelRemoteData {
  static const _apiUrl =
      'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';
  static const _apiUr2 =
      'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';
  static const _apiUr3 =
      'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8';

  final Dio httpClient;

  HotelRemoteDataImpl({required this.httpClient});

  @override
  Future<HotelModel> getHotel() async {
    try {
      final response = await httpClient.get(_apiUrl);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return HotelModel.fromJson(data);
      } else {
        throw ServerException('Responser status code is $response.statusCode');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<RoomsModel> getRooms() async {
    try {
      final response = await httpClient.get(_apiUr2);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return RoomsModel.fromJson(data);
      } else {
        throw ServerException('Responser status code is $response.statusCode');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<BookHotelModel> getBookHotel() async {
    try {
      final response = await httpClient.get(_apiUr3);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        return BookHotelModel.fromJson(data);
      } else {
        throw ServerException('Responser status code is $response.statusCode');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
