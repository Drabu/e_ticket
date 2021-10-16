import 'package:dope_ticket/sections/booking_details.dart';
import 'package:dope_ticket/sections/refundable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sections/airline_type.dart';
import 'sections/airlines.dart';
import 'sections/baggage.dart';
import 'sections/info_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Ticket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'e-Ticket'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _airlineKey = GlobalKey<AirLinesState>();
  final _airlineTypeKey = GlobalKey<AirLineTypeState>();
  final _ticketHolderKey = GlobalKey<TicketHolderDetailsState>();
  final _refunadbleSectionKey = GlobalKey<RefundableState>();
  final _baggageSectionKey = GlobalKey<BaggageState>();
  final _bookingDetailsKey = GlobalKey<BookkingDetailsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AirLines(
                key: _airlineKey,
              ),
              AirLineType(
                key: _airlineTypeKey,
              ),
              TicketHolderDetails(
                key: _ticketHolderKey,
              ),
              Refundable(
                key: _refunadbleSectionKey,
              ),
              Baggage(
                key: _baggageSectionKey,
              ),
              BookingDetails(
                key: _bookingDetailsKey,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        print(_bookingDetailsKey.currentState!.validate.toString());
                        print(_ticketHolderKey.currentState!.validate.toString());
                        print(_airlineTypeKey.currentState!.validate.toString());
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
