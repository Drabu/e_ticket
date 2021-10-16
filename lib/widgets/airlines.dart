import 'package:dope_ticket/commons/labels.dart';
import 'package:flutter/material.dart';

class AirLines extends StatefulWidget {
  const AirLines({required GlobalKey key}) : super(key: key);

  @override
  AirLinesState createState() => AirLinesState();
}

class AirLinesState extends State<AirLines> {
  String _value = L.one_way;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            L.airlines,
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          RadioListTile<String>(
            selected: true,
            title: const Text(L.one_way),
            value: L.one_way,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text(L.return_),
            value: L.return_,
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

  String? get validate => _value;
}
