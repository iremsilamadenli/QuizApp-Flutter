import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/options.dart';
import 'package:quiz_app/components/progress_bar.dart';
import 'package:quiz_app/components/question_card.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProgressBar(),
                  ),
                  SizedBox(height: 20,),
                 Obx(() =>  Text.rich(TextSpan(
                    text: " Question ${_questionController.questionNumber.value}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    children: [
                      TextSpan(
                        text: "/${_questionController.questions.length}",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ],
                  )),),
                  Divider(thickness: 1.5,),
                  SizedBox(height: 20,),
                  Container(
                    height: 500, 
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: _questionController.updateQnNumber,
                      controller: _questionController.pageController,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
