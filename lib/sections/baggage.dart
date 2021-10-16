import 'package:flutter/material.dart';

class Baggage extends StatefulWidget {
  const Baggage({required GlobalKey key}) : super(key: key);

  @override
  BaggageState createState() => BaggageState();
}

class BaggageState extends State<Baggage> {
  int _value = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Baggage',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        RadioListTile<int>(
          selected: true,
          title: const Text('15 Kg'),
          value: 15,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('20 Kg'),
          value: 20,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('25 Kg'),
          value: 25,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text('30 Kg'),
          value: 30,
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
