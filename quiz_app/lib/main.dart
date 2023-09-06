
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/final_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

void main() {
  runApp(MyApp(),
    );
}

class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen()
    );
  }
}
