import 'package:digivill/main.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  //const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameControllerSign = TextEditingController();
  TextEditingController passwordControllerSign = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameControllerSign,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordControllerSign,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // Container(
                //     height: 50,
                //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                //     child: ElevatedButton(
                //       child: const Text('Sign Up and Continue'),
                //       onPressed: () {
                //         print(nameControllerSign.text);
                //         print(passwordControllerSign.text);
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => MyStatefulWidget()),
                //         );
                //       },
                //     )),
              ],
            )),
      ),
    );
  }
}
