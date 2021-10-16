import 'package:dope_ticket/models/passenger_model.dart';

class TicketHolderDetailsHolder {
  String timings;
  String date;
  String ticketNumber;
  String dateOfBirth;
  String pnr;
  String name;
  List<Passenger> passsengerList;

  TicketHolderDetailsHolder({
    required this.timings,
    required this.date,
    required this.ticketNumber,
    required this.dateOfBirth,
    required this.name,
    required this.pnr,
    required this.passsengerList,
  });
}