import 'package:flutter/material.dart';
import 'afterlogin.dart';
import 'waterday.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  static double waterTotal = double.parse(InformationState.watereq);
  static double daysTotal=double.parse(WaterdayState.finaldays.length.toString());
  static double waterperday=(waterTotal/daysTotal);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                children: [
                  Text("Days to give water this week:"),
                  SizedBox(
                    height: 150,
                    child: Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: WaterdayState.finaldays.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Text(WaterdayState.finaldays[index]),
                                  Text("Water Required: "+waterperday.toStringAsFixed(2)+"  Litres"),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
        ]),
      ),
    );
  }
}
