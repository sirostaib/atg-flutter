// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:atg/login/loginview.dart';
import 'package:atg/student/report_issue/report_issue_view.dart';
import '../models/currentuser.dart';
import 'package:settings_ui/settings_ui.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class profile_view extends StatefulWidget {
  profile_view(this.myUser);
  User myUser;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<profile_view> {
  get child => null;
  bool f = true;

  @override
  Widget build(BuildContext context) {
    var leading;
    return Scaffold(
        // ignore: duplicate_ignore
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(widget.myUser.Name + "'s Profile"),
        ),
        body: new Container(

            // ignore: duplicate_ignore
            child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: new BoxDecoration(color: Colors.blue[600]),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Center(
                child: Container(
                    width: 250,
                    height: 250,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: widget.myUser.userType == "lecturer"
                        ? Image.asset('lib/images/lecturer.png',
                            fit: BoxFit.fill)
                        : Image.asset('lib/images/student.png',
                            fit: BoxFit.fill))),
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.blue[600]!,
                  width: 2,
                ),
              )),
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: Text(
                widget.myUser.Name,
                style: TextStyle(color: Colors.grey, fontSize: 25),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(30, 30, 0, 10),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.email, size: 40, color: Colors.blue[600]),
                  title: Text(
                    widget.myUser.email,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone, size: 40, color: Colors.blue[600]),
                  title: Text(
                    widget.myUser.phone,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 40,
                    child: CheckboxListTile(
                      title: Text("Enable Notifications"),
                      checkColor: Colors.white,
                      value: f,
                      onChanged: (bool? value) {
                        setState(() {
                          //isChecked = !isChecked;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(5)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => report_issue_view(widget.myUser)));
              },
              child: widget.myUser.userType == "student"
                  ? Text(
                      'Report Issue',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : Text(
                      'Set Constrains',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
            height: 50,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(5)),
            child: FlatButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => LoginDemo()));
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // ignore: deprecated_member_use
          ),
        ])));
  }
}
