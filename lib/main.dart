import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase/firebase.dart';
import 'package:atg/login/loginview.dart';

void main() async {
  // From Firebase configuration setup
/*
const firebaseConfig = {
  apiKey: "AIzaSyAj3sSDPqhDXsn3Autg0nyYHQXzB7BwUEU",
  authDomain: "atg-mobile-75f6e.firebaseapp.com",
  projectId: "atg-mobile-75f6e",
  storageBucket: "atg-mobile-75f6e.appspot.com",
  messagingSenderId: "861518897090",
  appId: "1:861518897090:web:daf93abc933b363ed3405b"
};
*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAj3sSDPqhDXsn3Autg0nyYHQXzB7BwUEU", // Your apiKey
      appId: "1:861518897090:web:daf93abc933b363ed3405b", // Your appId
      messagingSenderId: "861518897090", // Your messagingSenderId
      projectId: "atg-mobile-75f6e", // Your projectId
    ),
  );
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}
