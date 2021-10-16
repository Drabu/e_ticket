import 'package:dope_ticket/commons/labels.dart';
import 'package:flutter/material.dart';

class Refundable extends StatefulWidget {
  const Refundable({required Key key}) : super(key: key);

  @override
  RefundableState createState() => RefundableState();
}

class RefundableState extends State<Refundable> {
  String _value = L.non_refunded;

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
              L.refundable,
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
                    L.refund,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  value: L.refund,
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
                    L.non_refunded,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  value: L.non_refunded,
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

  String? get validate => _value;
}
