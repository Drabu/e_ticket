import 'package:dope_ticket/commons/default_validator.dart';
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
  final _bookingIdController = TextEditingController();
  final _referrenceNumberController = TextEditingController();
  final _grandTotalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            children: [
              TextFormField(
                validator: defaultValidator,
                decoration: InputDecoration(
                  hintText: 'Booking Id',
                ),
              ),
              TextFormField(
                validator: defaultValidator,
                decoration: InputDecoration(
                  hintText: 'Reference no',
                ),
              ),
              TextFormField(
                validator: defaultValidator,
                controller: _bookingDateEditingController,
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
                validator: defaultValidator,
                controller: _grandTotalController,
                decoration: InputDecoration(
                  hintText: 'Grand Total',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BookingDetailsHolder? get validate {
    if (_formKey.currentState?.validate() ?? false)
      return BookingDetailsHolder(
        grandTotal: int.tryParse(_grandTotalController.text) ?? 0,
        bookingDate: _bookingDateEditingController.text,
        referrenceNumber: _referrenceNumberController.text,
        bookingId: _bookingIdController.text,
      );

    return null;
  }
}

class BookingDetailsHolder {
  int grandTotal;
  String bookingDate;
  String referrenceNumber;
  String bookingId;
  BookingDetailsHolder({
    required this.grandTotal,
    required this.bookingDate,
    required this.referrenceNumber,
    required this.bookingId,
  });
}
