import 'package:dartz/dartz.dart';
import 'package:test_app_effective/common/errors/failures.dart';
import 'package:test_app_effective/domain/models/rooms.dart';
import 'package:test_app_effective/domain/repositories/hotel_profile_repository.dart';
import 'package:test_app_effective/domain/usecases/usecase.dart';

class GetRooms extends UseCase<Rooms, void> {
  final HotelRepository hotelRepository;

  GetRooms(this.hotelRepository);

  @override
  Future<Either<Failure, Rooms>> call([params]) async {
    return await hotelRepository.getRooms();
  }
}
