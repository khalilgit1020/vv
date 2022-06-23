import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mqtt_client/mqtt_client.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:SignInScreen() ,
    );
  }
}

