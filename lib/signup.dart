import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String uname = '';
  String pwd = '';
  bool visible = false;


  Future Signup() async {
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    var url = 'http://192.168.8.196/FlutterLoginAPI/2.php';
    var data = {'email': email, 'password': password};
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    if (message == 'New record created successfully') {
      setState(() {
        visible = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
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
    }

    else{
      setState(() {
        visible = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
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
    }
    print("done");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(
              children: <Widget>[
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
                      child: Text('SignUp'),
                      onPressed: Signup,
                    )),
              ],
            ))));
  }
}
