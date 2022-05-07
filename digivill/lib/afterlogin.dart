import 'package:digivill/waterday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class Information extends StatefulWidget {
  @override
  State<Information> createState() => InformationState();
}

class InformationState extends State<Information> {
  String dropdownValue = "Wheat";
  String dropdownValueStage = "Sowing";
  static String lati = "";
  static String longi = "";
  static final landSize = TextEditingController();
  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    lati = position.latitude.toString();
    longi = position.longitude.toString();
  }

  int t = 0;
  void datama() {
    if (dropdownValueStage == "Sowing")
      t = 0;
    else if (dropdownValueStage == "Growth1")
      t = 1;
    else if (dropdownValueStage == "Growth2")
      t = 2;
    else if (dropdownValueStage == "Mature") t = 3;
  }

  static String watereq = "";

  postdata() async {
    try {
      var response = await http.post(
          Uri.parse("https://cryptic-scrubland-03054.herokuapp.com/data/"),
          body: {
            "crop": dropdownValue,
            "crop_age": t.toString(),
            "field_area": landSize.text,
            "long": longi,
            "lat": lati,
          });
      watereq = response.body.toString();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data input'),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/water.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  // child: const Text(
                  //   'Data input',
                  //   style: TextStyle(fontSize: 20),
                  // )
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Set Location '),
                              Icon(Icons.my_location_rounded),
                            ]),
                      ),
                      onPressed: determinePosition,
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Land Size(in sq. m)',
                    ),
                    controller: landSize,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Text("Select the crop:"),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>["Rice", "Wheat", "Cotton"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value +
                            "                                "),
                      );
                    }).toList(),
                  ),
                ),
                Text("Select age of crop:"),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: DropdownButton<String>(
                    value: dropdownValueStage,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueStage = newValue!;
                      });
                    },
                    items: <String>["Sowing", "Growth1", "Growth2", "Mature"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value +
                            "                               "),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        datama();
                        postdata();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Waterday()),
                        );
                      },
                    )),
              ],
            )),
      ),
    );
  }
}
