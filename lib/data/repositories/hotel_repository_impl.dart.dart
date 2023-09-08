import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_app_effective/common/errors/failures.dart';
import 'package:test_app_effective/data/datasources/hotel_remote.dart';
import 'package:test_app_effective/domain/models/book_hotel.dart';
import 'package:test_app_effective/domain/models/hotel.dart';
import 'package:test_app_effective/domain/models/rooms.dart';
import 'package:test_app_effective/domain/repositories/hotel_profile_repository.dart';

import '../../common/errors/exceptions.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteData remoteDataSource;
  final InternetConnectionChecker connectionChecker;
  HotelRepositoryImpl(
      {required this.remoteDataSource, required this.connectionChecker});

  @override
  Future<Either<Failure, Hotel>> getHotel() async {
    try {
      final Hotel hotel = await remoteDataSource.getHotel();

      return Right(hotel);
    } on ServerException {
      // If we have a ServerException, but we have an internet connection,
      // we can try to get the schedule from the local storage

      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Rooms>> getRooms() async {
    try {
      final Rooms rooms = await remoteDataSource.getRooms();

      return Right(rooms);
    } on ServerException {
      // If we have a ServerException, but we have an internet connection,
      // we can try to get the schedule from the local storage

      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookHotel>> getBookInfo() async {
    try {
      final BookHotel book = await remoteDataSource.getBookHotel();

      return Right(book);
    } on ServerException {
      // If we have a ServerException, but we have an internet connection,
      // we can try to get the schedule from the local storage

      return const Left(ServerFailure());
    }
  }
}
