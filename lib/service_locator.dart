import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_effective/data/datasources/hotel_remote.dart';
import 'package:test_app_effective/data/repositories/hotel_repository_impl.dart.dart';
import 'package:test_app_effective/domain/repositories/hotel_profile_repository.dart';
import 'package:test_app_effective/domain/usecases/get_book_info.dart';
import 'package:test_app_effective/domain/usecases/get_hotel.dart';
import 'package:test_app_effective/domain/usecases/get_rooms.dart';
import 'package:test_app_effective/presentation/bloc/book_info_bloc/book_info_bloc.dart';
import 'package:test_app_effective/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:test_app_effective/presentation/bloc/rooms_bloc/rooms_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory(() => HotelBloc(getHotel: getIt()));
  getIt.registerFactory(() => RoomsBloc(getRooms: getIt()));
  getIt.registerFactory(() => BookInfoBloc(getBookInfo: getIt()));

  getIt.registerLazySingleton(() => GetHotel(getIt()));
  getIt.registerLazySingleton(() => GetRooms(getIt()));
  getIt.registerLazySingleton(() => GetBookInfo(getIt()));

  getIt.registerLazySingleton<HotelRepository>(() => HotelRepositoryImpl(
        remoteDataSource: getIt(),
        connectionChecker: getIt(),
      ));

  getIt.registerLazySingleton<HotelRemoteData>(
      () => HotelRemoteDataImpl(httpClient: getIt()));
  getIt.registerLazySingleton(() => Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000))));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
