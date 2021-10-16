import 'package:flutter/material.dart';

class AirLineType extends StatefulWidget {
  AirLineType({required GlobalKey key}) : super(key: key);

  @override
  AirLineTypeState createState() => AirLineTypeState();
}

class AirLineTypeState extends State<AirLineType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
