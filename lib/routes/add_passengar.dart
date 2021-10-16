import 'package:dope_ticket/commons/default_validator.dart';
import 'package:dope_ticket/widgets/passenger_widget.dart';
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
      () => Text('Male'),
    );
    widget._map.putIfAbsent(
      Passenger.FEMALE,
      () => Text('Female'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Passengar'),
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
                  hintText: 'Passenger First Name',
                ),
              ),
              TextFormField(
                validator: defaultValidator,
                controller: widget._lastNameController,
                decoration: InputDecoration(
                  hintText: 'Passenger Last Name',
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
                      child: Text('Add Passenger'),
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
