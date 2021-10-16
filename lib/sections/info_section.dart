import 'package:flutter/material.dart';

import 'package:dope_ticket/commons/default_validator.dart';
import 'package:dope_ticket/sections/passenger_widget.dart';

import '../commons/date_picker.dart';

class TicketHolderDetails extends StatefulWidget {
  final _dateOfBirthEditingController = TextEditingController();
  final _dateOfFlightEditingController = TextEditingController();
  final _timingsController = TextEditingController();
  final _ticketNumberController = TextEditingController();
  final _pnrController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TicketHolderDetails({required Key key}) : super(key: key);

  @override
  TicketHolderDetailsState createState() => TicketHolderDetailsState();
}

class TicketHolderDetailsState extends State<TicketHolderDetails> {
  DateTime? _dateOfBirth;
  DateTime? _dateOfFlight;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          TextFormField(
            validator: defaultValidator,
            controller: widget._nameController,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          PassengersList(),
          TextFormField(
            validator: defaultValidator,
            controller: widget._dateOfBirthEditingController,
            onTap: () {
              showCustomDateDialog(
                initialDate: _dateOfBirth ?? DateTime.now(),
                callback: (DateTime? date) {
                  setState(() {
                    _dateOfBirth = date;
                    widget._dateOfBirthEditingController.text = date.toString();
                  });
                },
                context: context,
              );
            },
            decoration: InputDecoration(
              hintText: 'Date of birth',
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: widget._pnrController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: 'PNR',
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: widget._ticketNumberController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: 'Ticket no',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextFormField(
                  validator: defaultValidator,
                  controller: widget._dateOfFlightEditingController,
                  onTap: () {
                    showCustomDateDialog(
                      initialDate: _dateOfFlight ?? DateTime.now(),
                      context: context,
                      callback: (DateTime? date) {
                        setState(() {
                          _dateOfFlight = date;
                          widget._dateOfFlightEditingController.text = date.toString();
                        });
                      },
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Date',
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: widget._timingsController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: 'Timings',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TicketHolderDetailsHolder? get validate {
    if (widget._formKey.currentState?.validate() ?? false)
      return TicketHolderDetailsHolder(
        date: widget._dateOfFlightEditingController.text,
        dateOfBirth: widget._dateOfBirthEditingController.text,
        name: widget._nameController.text,
        pnr: widget._pnrController.text,
        ticketNumber: widget._ticketNumberController.text,
        timings: widget._timingsController.text,
        passsengerList: [],
      );
    return null;
  }
}

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
