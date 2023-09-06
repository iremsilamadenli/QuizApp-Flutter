
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/final_screen.dart';


// SingleGetTickerProviderMixin is deprecated,
// use GetSingleTickerProviderStateMixin instead
class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {


 //Animation part of our code
 late AnimationController _animationController;
   late Animation<double> _animation; // Use Animation<int> for integer values
//we can reach our animation outside 
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map((question) => Question( 
    id: question['id'],
    question: question['question'],
    options: question['options'],
    answer: question['answer_index']
    
    )).toList(); 

    List<Question> get questions => this._questions;

bool _isAnswered = false; //as a class variable
bool get isAnswered => _isAnswered; // as a getter

late int _correctAns = 0; 
int get correctAns => this._correctAns;


late int _selectedAns; 
int get selectedAns => this._selectedAns;

//
RxInt _questionNumber = 1.obs;
RxInt get questionNumber => this._questionNumber;


late int _numOfCorrectAns = 0 ; 
int get numOfCorrectAns => this._numOfCorrectAns;



  @override
  void onInit() {
    // onInıt: calls immediately after the widget is allocated memory
    //animation duration is 60s 
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = (Tween<double>(begin: 0 , end: 1).animate(_animationController)
    ..addListener(() {
      //update like setState
      update();
    })) ;
    //start out animation
    
    _animationController.forward().whenComplete(nextQuest);
 //we go to indicator and we wrap stack with streambuilder

    _pageController = PageController();



    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }
  void checkAns(Question question, int selectedIndex ) {
    //when user clicked any option, it will run
    _isAnswered = true;
    _correctAns = question.answer!;
    _selectedAns = selectedIndex;
    
    if(_correctAns == _selectedAns ) {_numOfCorrectAns++;}

    //For stopping the counter
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), (){
      nextQuest();
    });


  }
  
  void updateQnNumber( int index){
    _questionNumber.value = index + 1; 
  }

  void nextQuest (){
    if (_questionNumber.value != _questions.length) {
         _isAnswered =false ;
        _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuest);
    }
    else {
      Get.to(FinalScreen());
    }
 
  }
}