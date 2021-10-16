import 'package:dope_ticket/sections/booking_details.dart';
import 'package:dope_ticket/widgets/refundable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'commons/labels.dart';
import 'sections/airline_type.dart';
import 'widgets/airlines.dart';
import 'widgets/baggage.dart';
import 'sections/info_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: L.e_ticket,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: L.e_ticket),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final _bookingDetailsKey = GlobalKey<BookkingDetailsState>();
  final _ticketHolderKey = GlobalKey<TicketHolderDetailsState>();
  final _airlineTypeKey = GlobalKey<AirLineTypeState>();

  final _airlineKey = GlobalKey<AirLinesState>();
  final _refunadbleSectionKey = GlobalKey<RefundableState>();
  final _baggageSectionKey = GlobalKey<BaggageState>();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                key: widget._airlineKey,
              ),
              AirLineType(
                key: widget._airlineTypeKey,
              ),
              TicketHolderDetails(
                key: widget._ticketHolderKey,
              ),
              Refundable(
                key: widget._refunadbleSectionKey,
              ),
              Baggage(
                key: widget._baggageSectionKey,
              ),
              BookingDetails(
                key: widget._bookingDetailsKey,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          print(widget._bookingDetailsKey.currentState!.validate.toString());
                          print(widget._ticketHolderKey.currentState!.validate.toString());
                          print(widget._airlineTypeKey.currentState!.validate.toString());

                          print(widget._refunadbleSectionKey.currentState!.validate.toString());
                          print(widget._baggageSectionKey.currentState!.validate.toString());
                          print(widget._airlineKey.currentState!.validate.toString());
                        },
                        child: Text(L.submit),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
