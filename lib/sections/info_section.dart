import 'package:dope_ticket/commons/labels.dart';
import 'package:dope_ticket/models/ticket_holder_model.dart';
import 'package:flutter/material.dart';

import 'package:dope_ticket/commons/default_validator.dart';
import 'package:dope_ticket/widgets/passenger_widget.dart';

import '../commons/date_picker.dart';

class TicketHolderDetails extends StatefulWidget {
  final _dateOfBirthEditingController = TextEditingController();
  final _dateOfFlightEditingController = TextEditingController();
  final _timingsController = TextEditingController();
  final _ticketNumberController = TextEditingController();
  final _pnrController = TextEditingController();
  final _nameController = TextEditingController();
  final _passengerListKey = GlobalKey<PassengersListState>();
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
              hintText: L.name,
            ),
          ),
          PassengersList(key: widget._passengerListKey),
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
            decoration: InputDecoration(hintText: L.date_of_birth),
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: widget._pnrController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: L.pnr,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: widget._ticketNumberController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: L.ticket_no,
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
                    hintText: L.date,
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: widget._timingsController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: L.timings,
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
        passsengerList: widget._passengerListKey.currentState?.passengerList ?? [],
      );
    return null;
  }
}


