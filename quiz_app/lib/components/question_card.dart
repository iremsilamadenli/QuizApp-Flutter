
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/options.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key, required this.question,
  }) : super (key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {

  QuestionController _controller = Get.put(QuestionController());
    return Container(
      
       margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
           question.question!,
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),),
          SizedBox(height: 20,),
          ...List.generate(question.options!.length, (index) => Option(text: question.options![index], index: index, press: (){

            _controller.checkAns(question, index);
          }))
        ],
      ),
    );
  }
}
