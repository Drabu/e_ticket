import 'package:flutter/material.dart';

class AirLines extends StatefulWidget {
  const AirLines(GlobalKey key) : super(key: key);

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
