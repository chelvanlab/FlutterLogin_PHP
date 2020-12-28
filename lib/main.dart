import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  String uname = '';
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - tutorialkart.com'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: username_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      uname = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  controller: password_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passsword',
                  ),
                  onChanged: (text) {
                    setState(() {
                      pwd = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),

            // Container(
            //   margin: EdgeInsets.all(20),
            //   child: Text(pwd),
            // )

            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    print(username_controller.text);
                    print(password_controller.text);

                    
                  },
                )),
          ]))),
    );
  }
}

