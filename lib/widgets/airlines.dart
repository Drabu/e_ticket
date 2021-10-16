import 'package:flutter/material.dart';

class AirLines extends StatefulWidget {
  const AirLines({required GlobalKey key}) : super(key: key);

  @override
  AirLinesState createState() => AirLinesState();
}

class AirLinesState extends State<AirLines> {
  String _value = 'One Way';

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
          RadioListTile<String>(
            selected: true,
            title: const Text('One Way'),
            value: 'One Way',
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Return'),
            value: 'Return',
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
