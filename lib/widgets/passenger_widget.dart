import 'package:dope_ticket/commons/labels.dart';
import 'package:dope_ticket/models/passenger_model.dart';

import '../routes/add_passengar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengersList extends StatefulWidget {
  PassengersList({required GlobalKey? key}) : super(key: key);

  @override
  PassengersListState createState() => PassengersListState();
}

class PassengersListState extends State<PassengersList> {
  List<Passenger> passengerList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () async {
              var res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddPassengerPage(),
                ),
              );
              passengerList.add(res);
              setState(() {});
            },
            child: Text(L.add_new_passenger),
          ),
        ),
        ...passengerList.map((e) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(e.gender.toString()),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Text(e.passengerFirstName),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Text(e.passengerLastName),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    passengerList.remove(e);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ],
    );
  }
}

