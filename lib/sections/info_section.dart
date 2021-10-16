import 'package:dope_ticket/commons/default_validator.dart';
import 'package:dope_ticket/sections/passenger_widget.dart';
import 'package:flutter/material.dart';

import '../commons/date_picker.dart';

class TicketHolderDetails extends StatefulWidget {
  TicketHolderDetails({required Key key}) : super(key: key);

  @override
  TicketHolderDetailsState createState() => TicketHolderDetailsState();
}

class TicketHolderDetailsState extends State<TicketHolderDetails> {
  DateTime? _dateOfBirth;
  DateTime? _dateOfFlight;

  final _dateOfBirthEditingController = TextEditingController();
  final _dateOfFlightEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: defaultValidator,
          decoration: InputDecoration(
            hintText: 'Name',
          ),
        ),
        PassengersList(),
        TextFormField(
          validator: defaultValidator,
          controller: _dateOfBirthEditingController,
          onTap: () {
            showCustomDateDialog(
              initialDate: _dateOfBirth ?? DateTime.now(),
              callback: (DateTime? date) {
                setState(() {
                  _dateOfBirth = date;
                  _dateOfBirthEditingController.text = date.toString();
                });
                //date of birth
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
                validator: defaultValidator,
                decoration: InputDecoration(
                  hintText: 'PNR',
                ),
              ),
            ),
            Flexible(
              child: TextFormField(
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
                controller: _dateOfFlightEditingController,
                onTap: () {
                  showCustomDateDialog(
                    initialDate: _dateOfFlight ?? DateTime.now(),
                    context: context,
                    callback: (DateTime? date) {
                      setState(() {
                        _dateOfFlight = date;
                        _dateOfFlightEditingController.text = date.toString();
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
                validator: defaultValidator,
                decoration: InputDecoration(
                  hintText: 'Timings',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
