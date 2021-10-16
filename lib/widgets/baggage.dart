import 'package:dope_ticket/commons/labels.dart';
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
            L.baggage,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        RadioListTile<int>(
          selected: true,
          title: const Text(L.kg_15),
          value: 15,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text(L.kg_20),
          value: 20,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text(L.kg_25),
          value: 25,
          groupValue: _value,
          onChanged: (val) {
            setState(() {
              _value = val!;
            });
          },
        ),
        RadioListTile<int>(
          title: const Text(L.kg_30),
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

  String? get validate => _value.toString();
}
