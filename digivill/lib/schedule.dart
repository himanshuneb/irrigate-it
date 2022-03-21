import 'package:flutter/material.dart';
import 'afterlogin.dart';
import 'waterday.dart';

class schedule extends StatefulWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  static int waterperday = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Days to give water this week:"),
          SizedBox(
            height: 100,
            child: Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: WaterdayState.finaldays.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(WaterdayState.finaldays[index]),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
