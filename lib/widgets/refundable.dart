import 'package:flutter/material.dart';

class Refundable extends StatefulWidget {
  const Refundable({required Key key}) : super(key: key);

  @override
  RefundableState createState() => RefundableState();
}

class RefundableState extends State<Refundable> {
  String _value = 'Non Refunded';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Refundable',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: RadioListTile<String>(
                  title: const Text(
                    'Refund',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  value: 'Refund',
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
                child: RadioListTile<String>(
                  selected: true,
                  title: const Text(
                    'Non Refunded',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  value: 'Non Refunded',
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
        ],
      ),
    );
  }
}
