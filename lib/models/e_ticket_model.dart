import 'package:dope_ticket/models/ticket_holder_model.dart';
import 'package:dope_ticket/sections/airline_type.dart';

import 'booking_details_model.dart';

class ETicketModel {
  String airline;
  String refundable;
  String baggage;
  BookingDetailsHolder bookingDetails;
  AirLineTypeHolder airLineType;
  TicketHolderDetailsHolder ticketHolderDetails;
  ETicketModel({
    required this.airline,
    required this.refundable,
    required this.baggage,
    required this.bookingDetails,
    required this.airLineType,
    required this.ticketHolderDetails,
  });
}
