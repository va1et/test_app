import 'package:equatable/equatable.dart';
import 'package:test_app_effective/data/models/hotel_modal.dart';

class Hotel extends Equatable {
  final int id;
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceDescription;
  final int? rating;
  final String? ratingName;
  final List<String> images;
  final HotelAboutModel? hotelAbout;

  const Hotel(
      {required this.name,
      required this.id,
      required this.adress,
      required this.minimalPrice,
      required this.priceDescription,
      required this.rating,
      required this.ratingName,
      required this.images,
      required this.hotelAbout});

  @override
  List<Object?> get props => [
        name,
        id,
        adress,
        minimalPrice,
        priceDescription,
        rating,
        ratingName,
        images,
        hotelAbout
      ];
}

class HotelValues extends Equatable {
  const HotelValues({
    required this.audits,
  });

  final List<Hotel> audits;

  @override
  List<Object?> get props => [audits];
}

class HotelAbout extends Equatable {
  const HotelAbout({
    required this.description,
    required this.peculiarities,
  });
  final String? description;
  final List<String> peculiarities;

  @override
  List<Object?> get props => [
        description,
        peculiarities,
      ];
}
