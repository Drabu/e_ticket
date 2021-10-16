import 'package:flutter/material.dart';

import '../commons/date_picker.dart';

class BookingDetails extends StatefulWidget {
  BookingDetails({required Key key}) : super(key: key);

  @override
  BookkingDetailsState createState() => BookkingDetailsState();
}

class BookkingDetailsState extends State<BookingDetails> {
  DateTime? _bookingDate;
  final _bookingDateEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Booking Id',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Reference no',
              ),
            ),
            TextFormField(
              onTap: () {
                showCustomDateDialog(
                  initialDate: _bookingDate,
                  context: context,
                  callback: (DateTime? date) {
                    setState(
                      () {
                        _bookingDate = date;
                        _bookingDateEditingController.text = date.toString();
                      },
                    );
                  },
                );
              },
              decoration: InputDecoration(
                hintText: 'Booking Date',
              ),
            ),
            TextFormField(
              controller: _bookingDateEditingController,
              decoration: InputDecoration(
                hintText: 'Grand Total',
              ),
            ),
          ],
        )
      ],
    );
  }
}
