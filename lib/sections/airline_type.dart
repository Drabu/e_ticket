import 'package:dope_ticket/commons/labels.dart';
import 'package:flutter/material.dart';

import 'package:dope_ticket/commons/default_validator.dart';

class AirLineType extends StatefulWidget {
  AirLineType({required GlobalKey key}) : super(key: key);

  final _goAirController = TextEditingController();
  final _indoGoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  AirLineTypeState createState() => AirLineTypeState();
}

class AirLineTypeState extends State<AirLineType> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                L.go_air,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                child: TextFormField(
                  controller: widget._goAirController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: L.flight_no,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                L.indigo,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                child: TextFormField(
                  controller: widget._indoGoController,
                  validator: defaultValidator,
                  decoration: InputDecoration(
                    hintText: L.flight_no,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AirLineTypeHolder? get validate => (widget._formKey.currentState?.validate() ?? false)
      ? AirLineTypeHolder(
          goAirFlightNumber: widget._goAirController.text,
          indigoFlightNumber: widget._indoGoController.text)
      : null;
}

class AirLineTypeHolder {
  String goAirFlightNumber;
  String indigoFlightNumber;
  AirLineTypeHolder({
    required this.goAirFlightNumber,
    required this.indigoFlightNumber,
  });
}
