import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"), // Replace with your PNG image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  Text(
                    "Let's play!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your information below"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                    Get.to(QuizScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20 * 0.75),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Let's start",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
