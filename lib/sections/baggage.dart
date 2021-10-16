import 'package:flutter/material.dart';

class Baggage extends StatefulWidget {
  const Baggage({required GlobalKey key}) : super(key: key);

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
