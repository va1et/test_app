import 'dart:convert';

import 'package:test_app_effective/domain/models/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required id,
    required name,
    required adress,
    required minimalPrice,
    required priceDescription,
    required rating,
    required ratingName,
    required images,
    required hotelAbout,
  }) : super(
          id: id,
          name: name,
          adress: adress,
          minimalPrice: minimalPrice,
          priceDescription: priceDescription,
          rating: rating,
          ratingName: ratingName,
          images: images,
          hotelAbout: hotelAbout,
        );

  factory HotelModel.fromRawJson(String str) =>
      HotelModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json["id"],
      name: json["name"],
      adress: json["adress"],
      minimalPrice: json["minimal_price"],
      priceDescription: json["price_for_it"],
      rating: json["rating"],
      ratingName: json["rating_name"],
      images: List<String>.from(json["image_urls"].map((x) => x)),
      hotelAbout: HotelAboutModel.fromJson(json["about_the_hotel"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "adress": adress,
        "minimal_price": minimalPrice,
        "price_for_it": priceDescription,
        "rating": rating,
        "rating_name": ratingName,
        "about_the_hotel": hotelAbout!.toJson(),
        "image_urls": List<dynamic>.from(images.map((x) => x)),
      };
}

class HotelAboutModel extends HotelAbout {
  const HotelAboutModel({required description, required peculiarities})
      : super(
          description: description,
          peculiarities: peculiarities,
        );

  factory HotelAboutModel.fromRawJson(String str) =>
      HotelAboutModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelAboutModel.fromJson(Map<String, dynamic> json) {
    return HotelAboutModel(
      description: json["description"],
      peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
    );
  }
  Map<String, dynamic> toJson() => {
        "description": description,
        "peculiarities": List<dynamic>.from(peculiarities.map((e) => e)),
      };
}
