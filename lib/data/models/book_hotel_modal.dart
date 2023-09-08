import 'dart:convert';

import 'package:test_app_effective/domain/models/book_hotel.dart';

class BookHotelModel extends BookHotel {
  const BookHotelModel({
    required String? name,
    required int id,
    required String? adress,
    required int? rating,
    required String? ratingName,
    required String? departure,
    required String? arrival,
    required String? dateStart,
    required String? dateStop,
    required int? numberOfNights,
    required String? nutrition,
    final String? room,
    required int? price,
    required int? fuelCharge,
    required int? serviceCharge,
  }) : super(
          id: id,
          name: name,
          adress: adress,
          rating: rating,
          ratingName: ratingName,
          departure: departure,
          arrival: arrival,
          dateStart: dateStart,
          dateStop: dateStop,
          numberOfNights: numberOfNights,
          nutrition: nutrition,
          price: price,
          room: room,
          fuelCharge: fuelCharge,
          serviceCharge: serviceCharge,
        );

  factory BookHotelModel.fromRawJson(String str) =>
      BookHotelModel.fromJson(jsonDecode(str));

  String toRawJson() => json.encode(toJson());

  factory BookHotelModel.fromJson(Map<String, dynamic> json) => BookHotelModel(
        id: json["id"],
        name: json["hotel_name"],
        adress: json["hotel_adress"],
        rating: json["horating"],
        ratingName: json["rating_name"],
        departure: json["departure"],
        arrival: json["arrival_country"],
        dateStart: json["tour_date_start"],
        dateStop: json["tour_date_stop"],
        numberOfNights: json["number_of_nights"],
        room: json["room"],
        nutrition: json["nutrition"],
        price: json["tour_price"],
        fuelCharge: json["fuel_charge"],
        serviceCharge: json["service_charge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_name": name,
        "hotel_adress": adress,
        "horating": rating,
        "rating_name": ratingName,
        "departure": departure,
        "arrival_country": arrival,
        "tour_date_start": dateStart,
        "tour_date_stop": dateStop,
        "number_of_nights": numberOfNights,
        "room": room,
        "nutrition": nutrition,
        "tour_price": price,
        "fuel_charge": fuelCharge,
        "service_charge": serviceCharge,
      };
}
