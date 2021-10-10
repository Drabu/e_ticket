import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddPassengerPage extends StatefulWidget {
  const AddPassengerPage();

  @override
  _AddPassengerPageState createState() => _AddPassengerPageState();
}

class _AddPassengerPageState extends State<AddPassengerPage> {
  Map<String, Widget> map = new Map();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  String currentValue = Passenger.MALE;

  @override
  void initState() {
    super.initState();

    map.putIfAbsent(
      Passenger.MALE,
      () => Text('Male'),
    );
    map.putIfAbsent(
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
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: 'Passenger First Name',
                ),
              ),
              TextFormField(
                controller: lastNameController,
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
                      children: map,
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
                        Navigator.of(context).pop(Passenger(
                          gender: currentValue,
                          passengerFirstName: firstNameController.text,
                          passengerLastName: lastNameController.text,
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
