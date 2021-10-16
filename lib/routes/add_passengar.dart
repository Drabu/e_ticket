import 'package:dope_ticket/commons/default_validator.dart';
import 'package:dope_ticket/commons/labels.dart';
import 'package:dope_ticket/models/passenger_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPassengerPage extends StatefulWidget {
  final Map<String, Widget> _map = new Map();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formState = GlobalKey<FormState>();

  @override
  _AddPassengerPageState createState() => _AddPassengerPageState();
}

class _AddPassengerPageState extends State<AddPassengerPage> {
  String currentValue = Passenger.MALE;

  @override
  void initState() {
    super.initState();

    widget._map.putIfAbsent(
      Passenger.MALE,
      () => Text(L.male),
    );
    widget._map.putIfAbsent(
      Passenger.FEMALE,
      () => Text(L.female),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.add_new_passenger),
      ),
      body: Form(
        key: widget._formState,
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: defaultValidator,
                controller: widget._firstNameController,
                decoration: InputDecoration(
                  hintText: L.first_name,
                ),
              ),
              TextFormField(
                validator: defaultValidator,
                controller: widget._lastNameController,
                decoration: InputDecoration(
                  hintText: L.last_name,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl<String>(
                      children: widget._map,
                      groupValue: currentValue,
                      onValueChanged: (val) {
                        setState(() {
                          currentValue = val;
                        });
                      },
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget._formState.currentState?.validate() ?? false)
                          Navigator.of(context).pop(Passenger(
                            gender: currentValue,
                            passengerFirstName: widget._firstNameController.text,
                            passengerLastName: widget._lastNameController.text,
                          ));
                      },
                      child: Text(L.add_passenger),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
