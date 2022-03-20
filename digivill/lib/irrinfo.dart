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
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20, 200, 20, 200),
          child: Card(
            //  shape: ShapeDecoration()
            elevation: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Total water required: " +
                          InformationState.watereq +
                          " litres"),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Land size: " +
                          InformationState.landSize.text +
                          " sq.meter"),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Number of days to water in the week: " +
                          WaterdayState.fucheck().toString()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Get the Schedule")),
                ],
              ),
            ),
          )),
    );
  }
}
