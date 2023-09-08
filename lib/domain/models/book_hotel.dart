import 'package:equatable/equatable.dart';

class BookHotel extends Equatable {
  final int id;
  final String? name;
  final String? adress;
  final int? rating;
  final String? ratingName;
  final String? departure;
  final String? arrival;
  final String? dateStart;
  final String? dateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? price;
  final int? fuelCharge;
  final int? serviceCharge;

  const BookHotel({
    required this.name,
    required this.id,
    required this.price,
    required this.adress,
    required this.rating,
    required this.ratingName,
    required this.departure,
    required this.arrival,
    required this.dateStart,
    required this.dateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        price,
        adress,
        rating,
        ratingName,
        departure,
        arrival,
        dateStart,
        dateStop,
        numberOfNights,
        room,
        nutrition,
        fuelCharge,
        serviceCharge
      ];
}
