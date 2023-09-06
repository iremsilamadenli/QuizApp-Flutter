import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/body.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuest, child: Text("Skip"))
        ],
      ),
      body: Body(),
    );
  }
}


