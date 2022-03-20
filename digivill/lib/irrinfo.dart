import 'package:flutter/material.dart';
import 'afterlogin.dart';
import 'waterday.dart';

class Irrinfo extends StatefulWidget {
  const Irrinfo({Key? key}) : super(key: key);

  @override
  State<Irrinfo> createState() => IrrinfoState();
}

class IrrinfoState extends State<Irrinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(40),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total Water Reqired: " +
                    InformationState.watereq +
                    " litres" +
                    "\n"),
                Text("Land Size:" +
                    InformationState.landSize.text +
                    " sq.meter" +
                    "\n"),
                Text("Number of Days to Water in the Week:" +
                    WaterdayState.fucheck().toString() +
                    "\n"),
              ],
            ),
          )),
    );
  }
}
