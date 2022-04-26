// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:atg/lecturer_dashbord/lecturer_view.dart';
import 'package:atg/student/student_dashbord/dashbord_view.dart';
import 'package:atg/login/loginview_model.dart';
import 'package:atg/models/currentuser.dart';
// used to recover password
import 'package:atg/student/report_issue/report_issue_view_model.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

// ignore: use_key_in_widget_constructors
class LoginDemo extends StatefulWidget {
  LoginDemo() {
    _deleteCacheDir();
  }
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

Future<void> _deleteCacheDir() async {
  Directory tempDir = await getTemporaryDirectory();

  if (tempDir.existsSync()) {
    tempDir.deleteSync(recursive: true);
  }
}

class _LoginDemoState extends State<LoginDemo> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  bool loginValidate = true;
  User currentUser = User.copy();
  String validateText = "";

  @override
  Widget build(BuildContext context) {
    loginValidate;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        title: Text("ATG - Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                  child: Container(
                      width: 800,
                      height: 150,
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('lib/images/atgbanner.png',
                          fit: BoxFit.fill))),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid Email'),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
                onChanged: (val) {
                  setState(() {
                    password = val;
                    //print("password is: " + password);
                  });
                },

                /// obscureText: true,
              ),
            ),
            !loginValidate
                ? Container(
                    child: validateText == ""
                        ? Text(
                            'Email or Password was Wrong!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 247, 0, 0),
                                fontSize: 14),
                          )
                        : Text(validateText,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14)),
                  )
                : Text(validateText),
            FlatButton(
              onPressed: () async {
                // FORGOT PASSWORD SCREEN GOES HERE
                if (email == "") {
                  setState(() {
                    validateText = "Please Enter your Email to reset password!";
                  });
                } else {
                  ReportController rc = ReportController();
                  bool check = await rc.addIssue(
                      User(
                          uid: "null",
                          code: "null",
                          department: "null",
                          email: email,
                          Name: "null",
                          userType: "null",
                          loggedin: false,
                          phone: "null"),
                      "This user has Forgotten their password, please send them their password to their respective email which is: " +
                          email);
                  if (check) {
                    setState(() {
                      validateText =
                          "Your password will be soon sent to your email.";
                    });
                  }
                }
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey[800], fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () async {
                  //print("asdfasdfadsfasdfadf");

                  LoginController lc = LoginController();
                  currentUser = await lc.loginCheck(email, password);
                  setState(() {
                    loginValidate = !currentUser.loggedin;
                    print("Email is final: " + currentUser.email);
                    print("error is: " + currentUser.loggedin.toString());
                  });

                  // await _auth.signInWithEmailAndPassword(email, password);
                  if (currentUser.userType == "none") {
                    // error could not sign in!
                    print("it is falsseeeee!");
                    loginValidate = !currentUser.loggedin;
                    setState(() {
                      if (currentUser.userType == "none") loginValidate = false;
                    });

                    loginValidate = currentUser.loggedin;
                  } else if (currentUser.userType == "lecturer") {
                    loginValidate = true;
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => lecturer_dashboard(currentUser)));
                  } else if (currentUser.userType == "student") {
                    loginValidate = true;
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => student_dashbord(currentUser)));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
