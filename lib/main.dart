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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String uname = '';
  String pwd = '';
  bool visible = false;

  Future UserLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'http://192.168.8.196/FlutterLoginAPI/1.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      print("You are login sucessfully");
      // // Navigate to Profile Screen & Sending Email to Next Screen.
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ProfileScreen(email : emailController.text))
      //   );
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('message'),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print("Login Failed");
    }
  }

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
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      uname = text;
                    });
                  },
                )),
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passsword',
                  ),
                  onChanged: (text) {
                    setState(() {
                      pwd = text;
                    });
                  },
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: UserLogin,
                )),
            Visibility(
                visible: visible,
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: CircularProgressIndicator())),
          ]))),
    );
  }
}
