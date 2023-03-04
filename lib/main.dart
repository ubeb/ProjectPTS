import 'package:state_management/LoginScreen.dart';
import 'package:state_management/RegisterScreen.dart';
import 'package:state_management/SplashScreen.dart';
import 'package:state_management/total_page.dart';
import 'package:state_management/user_page.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{

  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen()
      ),
    );
  }
}
