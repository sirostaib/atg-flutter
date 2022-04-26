// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:atg/profile/profile_view.dart';
import 'package:atg/student/student_dashbord/dashbord_viiew_model.dart';

///studens/student_dashbord/dashbord_viiew_model.dart';
import '../../models/currentuser.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class student_dashbord extends StatefulWidget {
  student_dashbord(this.myUser);
  User myUser;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<student_dashbord> {
  //get child => null;
  //var myCourses = <Course>[];
  _HomePageState();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // getData() async {
  //   CController cc = CController();
  //   print("2");
  //   myCourses = await cc.fetchCourses(widget.myUser.email);
  //   print("3");
  //   setState(() {});
  //   print(myCourses.toString());
  // }

  // bool checkCourses() {
  //   getData();
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final _kTabs = <Tab>[
      Tab(text: 'Sunday'),
      Tab(text: 'Monday'),
      Tab(text: 'Tuesday'),
      Tab(text: 'Wednesday'),
      Tab(text: 'Thursday'),
    ];

    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          // ignore: duplicate_ignore
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue[800],
            title: Text("Student Dashboard - " + widget.myUser.Name),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => profile_view(widget.myUser)));

                  // do something
                },
              ),
              // await getData() ? Text("") : Text(""),
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            children: _kTabPages,
          ),

          //  TabBar(
          //   isScrollable: true, // Required
          //   unselectedLabelColor: Colors.white30, // Other tabs color
          //   labelPadding:
          //       EdgeInsets.symmetric(horizontal: 30), // Space between tabs
          //   indicator: UnderlineTabIndicator(
          //     borderSide: BorderSide(
          //         color: Colors.white, width: 2), // Indicator height
          //     insets: EdgeInsets.symmetric(horizontal: 48), // Indicator width
          //   ),
          //   tabs: [
          //     Tab(text: 'Total Investment'),
          //     Tab(text: 'Your Earnings'),
          //     Tab(text: 'Current Balance'),
          //   ],
          // )

          // Container(
          //Text("These are your Courses: "),

          // child: myCourses.length != 0
          //     ? ListView.builder(
          //         itemCount: myCourses.length == 0 ? 0 : myCourses.length,
          //         itemBuilder: (BuildContext context, int indexx) {
          //           return ListTile(
          //             title: Text(
          //               myCourses.elementAt(indexx).cName,
          //               style: TextStyle(color: Colors.grey[800], fontSize: 20),
          //             ),
          //             tileColor: Colors.grey[300],
          //             trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //             onTap: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => course_attendance(
          //                       widget.myUser,
          //                       myCourses.elementAt(indexx).cCode,
          //                       myCourses.elementAt(indexx).cName),
          //                 ),
          //               );
          //             },
          //           );
          //         })
          //     : Row(
          //         children: [
          //           Center(
          //             child: Text(
          //               "There Are no Courses!",
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           checkCourses() ? Text("") : Text(""),
          //         ],
          //       ),
          //  ),
        ));
  }
}
