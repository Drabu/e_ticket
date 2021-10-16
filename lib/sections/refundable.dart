import 'package:flutter/material.dart';

class Refundable extends StatefulWidget {
  const Refundable({required Key key}) : super(key: key);

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
