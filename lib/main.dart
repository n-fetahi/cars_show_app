import 'package:fetahi_cars_show/screen/CarDetails.dart';
import 'package:fetahi_cars_show/screen/Home.dart';
import 'package:fetahi_cars_show/screen/Movement.dart';
import 'package:fetahi_cars_show/screen/SignInPage.dart';
import 'package:fetahi_cars_show/screen/SignUpPage.dart';
import 'package:fetahi_cars_show/screen/introScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:IntroScreen(),

    );
  }
}