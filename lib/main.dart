import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_passengar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Ticket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'e-Ticket'),
    );
  }
}

class PassengersList extends StatefulWidget {
  PassengersList({Key? key}) : super(key: key);

  @override
  PassengersListState createState() => PassengersListState();
}

class PassengersListState extends State<PassengersList> {
  List<Passenger> passengerList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddPassengerPage(),
                ),
              );
              passengerList.add(res);
              setState(() {});
            },
            child: Text('Add Passengar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: passengerList.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(passengerList[index].gender.toString()),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(passengerList[index].passengerFirstName),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(passengerList[index].passengerLastName),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          passengerList.removeAt(index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text('Remove'),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Passenger {
  static const MALE = 'M';
  static const FEMALE = 'F';

  final String passengerFirstName;
  final String passengerLastName;
  final String gender;

  Passenger({
    required this.passengerFirstName,
    required this.passengerLastName,
    required this.gender,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
        child: ListView(
          children: [
            AirLines(
              UniqueKey(),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'GoAir',
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
                    decoration: InputDecoration(
                      hintText: 'Flight No.',
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
                  'Indigo',
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
                    decoration: InputDecoration(
                      hintText: 'Flight No.',
                    ),
                  ),
                ),
              ],
            ),
            //===============
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            Flexible(
              flex: 2,
              child: PassengersList(),
            ),
            TextFormField(
              onTap: () {
                showDatePicker(
                        context: context,
                        // initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030))
                    .then((date) {
                  setState(() {
                    // _dateTime = date;
                  });
                });
              },
              decoration: InputDecoration(
                hintText: 'Date of birth',
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'PNR',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ticket no',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              // initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030))
                          .then((date) {
                        setState(() {
                          // _dateTime = date;
                        });
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Date',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Timings',
                    ),
                  ),
                ),
              ],
            ),
            Refundable(UniqueKey()),
            Text(
              'Baggage',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Baggage(
              UniqueKey(),
            ),
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
                    showDatePicker(
                            context: context,
                            // initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030))
                        .then((date) {
                      setState(() {
                        // _dateTime = date;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Booking Date',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Grand Total',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AirLines extends StatefulWidget {
  const AirLines(Key key) : super(key: key);

  @override
  AirLinesState createState() => AirLinesState();
}

class AirLinesState extends State<AirLines> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Airlines',
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          RadioListTile<int>(
            title: const Text('One Way'),
            value: 1,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
          ),
          RadioListTile<int>(
            title: const Text('Return'),
            value: 2,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
          ),
        ],
      ),
    );
  }
}

class Baggage extends StatefulWidget {
  const Baggage(Key key) : super(key: key);

  @override
  BaggageState createState() => BaggageState();
}

class BaggageState extends State<Baggage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioListTile<int>(
          title: const Text('15 Kg'),
          value: 1,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('20 Kg'),
          value: 2,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('25 Kg'),
          value: 3,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('30 Kg'),
          value: 4,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
      ],
    );
  }
}

class Refundable extends StatefulWidget {
  const Refundable(Key key) : super(key: key);

  @override
  RefundableState createState() => RefundableState();
}

class RefundableState extends State<Refundable> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: RadioListTile<int>(
              title: const Text(
                'Refund',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              value: 1,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              },
            ),
          ),
          Flexible(
            flex: 3,
            child: RadioListTile<int>(
              title: const Text(
                'Non Refunded',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              value: 2,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
