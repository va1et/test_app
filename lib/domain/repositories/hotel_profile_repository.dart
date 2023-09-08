import 'package:dartz/dartz.dart';
import 'package:test_app_effective/domain/models/book_hotel.dart';
import 'package:test_app_effective/domain/models/hotel.dart';
import 'package:test_app_effective/domain/models/rooms.dart';

import '../../common/errors/failures.dart';

abstract class HotelRepository {
  Future<Either<Failure, Hotel>> getHotel();
  Future<Either<Failure, Rooms>> getRooms();
  Future<Either<Failure, BookHotel>> getBookInfo();
}
