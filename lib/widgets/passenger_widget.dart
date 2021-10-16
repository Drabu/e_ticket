import '../routes/add_passengar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengersList extends StatefulWidget {
  PassengersList({Key? key}) : super(key: key);

  @override
  PassengersListState createState() => PassengersListState();
}

class PassengersListState extends State<PassengersList> {
  List<Passenger> passengerList = [];

  @override
  void initState() {
    super.initState();
  }

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
            child: Text('Add Passengar'),
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

class Passenger {
  static const MALE = 'M';
  static const FEMALE = 'F';

  final String passengerFirstName;
  final String passengerLastName;
  final String gender;

  Passenger({
    required this.passengerFirstName,
    required this.passengerLastName,
    required this.gender,
  });
}
