import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final int id;
  final String? name;

  final int? price;
  final String? priceDescription;

  final List<String> images;
  final List<String> roomAbout;

  const Room(
      {required this.name,
      required this.id,
      required this.price,
      required this.priceDescription,
      required this.images,
      required this.roomAbout});

  @override
  List<Object?> get props =>
      [name, id, price, priceDescription, images, roomAbout];
}

class Rooms extends Equatable {
  const Rooms({
    required this.rooms,
  });

  final List<Room> rooms;

  @override
  List<Object?> get props => [rooms];
}
