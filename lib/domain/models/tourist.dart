import 'package:equatable/equatable.dart';

class Tourist extends Equatable {
  final String name;
  final String surname;
  final String birthDate;
  final String citizenship;
  final String passportNumber;
  final String passportValidity;

  const Tourist({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.citizenship,
    required this.passportNumber,
    required this.passportValidity,
  });

  @override
  List<Object?> get props => [
        name,
        surname,
        birthDate,
        citizenship,
        passportValidity,
        passportNumber,
      ];
}
