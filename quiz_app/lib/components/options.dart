
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';

class Option extends StatelessWidget {
  const Option({
    super.key, required this.text, required this.index, required this.press,
  });

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {

    return 
      GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qncontroller) {
           Color getRightColor(){
            if (qncontroller.isAnswered) {
              if (index == qncontroller.correctAns) {
                return Colors.green;
              }else if (index == qncontroller.selectedAns && qncontroller.selectedAns != qncontroller.correctAns){
                return Colors.red;
              }
            }
return Colors.grey;
          }

          IconData getRightIcon(){
            return getRightColor() == Colors.red ? Icons.close : Icons.done ; 
          } 


          return InkWell(
            onTap: press,
            child: Container( margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
               
                      border: Border.all(color: getRightColor()),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${index + 1} $text", style: TextStyle(color: getRightColor(), fontSize: 16),),
                Container(width: 26,height: 26
                
                ,
                decoration: BoxDecoration(
                  
                  color: getRightColor() == Colors.grey ? Colors.transparent : getRightColor(),
                  border: Border.all(color: getRightColor()),borderRadius: BorderRadius.circular(20)),
                child: getRightColor() == Colors.grey ? null : Icon (getRightIcon(), size: 16,)
                ,)
                
                ],
              ),
          
              ),
          );
        }
      );
    
      
    
    
  }
}
