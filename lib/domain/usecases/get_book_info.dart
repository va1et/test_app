import 'package:dartz/dartz.dart';
import 'package:test_app_effective/common/errors/failures.dart';
import 'package:test_app_effective/domain/models/book_hotel.dart';
import 'package:test_app_effective/domain/repositories/hotel_profile_repository.dart';
import 'package:test_app_effective/domain/usecases/usecase.dart';

class GetBookInfo extends UseCase<BookHotel, void> {
  final HotelRepository hotelRepository;

  GetBookInfo(this.hotelRepository);

  @override
  Future<Either<Failure, BookHotel>> call([params]) async {
    return await hotelRepository.getBookInfo();
  }
}
