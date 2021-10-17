import 'package:dope_ticket/commons/labels.dart';
import 'package:dope_ticket/models/booking_details_model.dart';
import 'package:dope_ticket/models/e_ticket_model.dart';
import 'package:dope_ticket/models/passenger_model.dart';
import 'package:dope_ticket/models/ticket_holder_model.dart';
import 'package:dope_ticket/sections/airline_type.dart';
import 'package:pdf/widgets.dart';

dynamic printLayout() {
  ETicketModel model = ETicketModel(
      airLineType: AirLineTypeHolder(
        goAirFlightNumber: '123',
        indigoFlightNumber: '456',
      ),
      airline: 'Return',
      baggage: '15 Kg',
      refundable: 'Non Refundable',
      bookingDetails: BookingDetailsHolder(
        bookingDate: '25 09 1996',
        bookingId: '25091996',
        grandTotal: 100,
        referrenceNumber: '5091996',
      ),
      ticketHolderDetails: TicketHolderDetailsHolder(
        date: '15 09 1996',
        dateOfBirth: '25 09 1996',
        name: 'Burhan ud din',
        passsengerList: [
          Passenger(
            gender: 'M',
            passengerFirstName: 'Jon ahmad',
            passengerLastName: 'Doe',
          ),
          Passenger(
            gender: 'M',
            passengerFirstName: 'Jon ahmad',
            passengerLastName: 'Doe',
          ),
        ],
        pnr: '91996',
        ticketNumber: '96',
        timings: '4PM',
      ));

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: Text(
            L.e_ticket,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
      Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(L.airlines),
          Text(L.indigo + " " + L.flight_no),
          Text(L.go_air + " " + L.flight_no),
          Text(L.name),
          Text(L.date_of_birth),
          Text(L.pnr),
          Text(L.ticket_no),
          Text(L.date),
        ]),
        SizedBox(
          width: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(model.airline, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.airLineType.goAirFlightNumber, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.airLineType.indigoFlightNumber, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.ticketHolderDetails.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.ticketHolderDetails.dateOfBirth,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.ticketHolderDetails.pnr, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.ticketHolderDetails.ticketNumber,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(model.ticketHolderDetails.date, style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        Spacer(),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(L.timings),
              Text(L.refundable),
              Text(L.baggage),
              Text(L.booking_id),
              Text(L.refference_no),
              Text(L.booking_date),
              Text(L.grand_total),
              SizedBox(height: 12),
            ]),
        SizedBox(
          width: 10,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(model.ticketHolderDetails.timings,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.refundable, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.baggage, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.bookingDetails.bookingId, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.bookingDetails.referrenceNumber,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.bookingDetails.bookingDate, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model.bookingDetails.grandTotal.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
            ]),
      ]),
      SizedBox(height: 20),
      Text(L.passenger, style: TextStyle(fontWeight: FontWeight.bold)),
      ...model.ticketHolderDetails.passsengerList.map((e) => passengerWidget(e)),
    ],
  );
}

Widget passengerWidget(Passenger passenger) {
  return Row(children: [
    Text(passenger.gender),
    SizedBox(width: 10),
    Text(passenger.passengerFirstName),
    SizedBox(width: 10),
    Text(passenger.passengerLastName),
  ]);
}

Widget getContainer(Widget child) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    child: child,
  );
}
