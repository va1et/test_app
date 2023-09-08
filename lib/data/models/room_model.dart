import 'dart:convert';

import 'package:test_app_effective/domain/models/rooms.dart';

class RoomModel extends Room {
  const RoomModel({
    required int id,
    required String? name,
    required int? price,
    required String? priceDescription,
    required List<String> images,
    required List<String> roomAbout,
  }) : super(
            id: id,
            name: name,
            price: price,
            priceDescription: priceDescription,
            images: images,
            roomAbout: roomAbout);

  factory RoomModel.fromRawJson(String str) =>
      RoomModel.fromJson(jsonDecode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        priceDescription: json["price_per"],
        images: List<String>.from(json["image_urls"].map((x) => x)),
        roomAbout: List<String>.from(json["peculiarities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "price_per": priceDescription,
        "image_urls": List<dynamic>.from(images.map((x) => x)),
        "peculiarities": List<dynamic>.from(roomAbout.map((x) => x)),
      };
}

class RoomsModel extends Rooms {
  const RoomsModel({required this.rooms}) : super(rooms: rooms);

  // ignore: annotate_overrides, overridden_fields
  final List<RoomModel> rooms;

  factory RoomsModel.fromRawJson(String str) =>
      RoomsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
      rooms: List<RoomModel>.from(
          json["rooms"].map((x) => RoomModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
      };
}
