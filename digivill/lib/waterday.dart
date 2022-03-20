import 'package:digivill/irrinfo.dart';
import 'package:flutter/material.dart';

class Waterday extends StatefulWidget {
  const Waterday({Key? key}) : super(key: key);

  @override
  State<Waterday> createState() => WaterdayState();
}

class WaterdayState extends State<Waterday> {
  static int _len = 7;
  List<bool> isChecked = List.generate(_len, (index) => false);
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thusday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String _title = "Days to irrigate";
  static int checkdata = 0;
  static int fucheck() {
    return checkdata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: _len,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(days[index]),
                  trailing: Checkbox(
                      activeColor: Colors.blue,
                      onChanged: (checked) {
                        setState(
                          () {
                            isChecked[index] = checked!;
                            checkdata = isChecked
                                .where((check) => check == true)
                                .length;
                          },
                        );
                      },
                      value: isChecked[index]),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Irrinfo()),
                );
              }),
              child: Text("Continue"))
        ],
      ),
    );
  }
}
