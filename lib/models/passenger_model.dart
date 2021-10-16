class Passenger {
  static const MALE = 'M';
  static const FEMALE = 'F';

  final String passengerFirstName;
  final String passengerLastName;
  final String gender;

  Passenger({
    required this.passengerFirstName,
    required this.passengerLastName,
    required this.gender,
  });
}
