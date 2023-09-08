import 'package:dartz/dartz.dart';
import 'package:test_app_effective/common/errors/failures.dart';
import 'package:test_app_effective/domain/models/hotel.dart';
import 'package:test_app_effective/domain/repositories/hotel_profile_repository.dart';
import 'package:test_app_effective/domain/usecases/usecase.dart';

class GetHotel extends UseCase<Hotel, void> {
  final HotelRepository hotelRepository;

  GetHotel(this.hotelRepository);

  @override
  Future<Either<Failure, Hotel>> call([params]) async {
    return await hotelRepository.getHotel();
  }
}
