import 'package:cityapp/models/answeredquestionslist.dart';
import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  //final List answeredListMain;
  AnsweredQuestionsList answeredQuestionsList;

  Result(this.resultScore,this.answeredQuestionsList);
  String get resultString {
    var resultStr;

    print('The answer chosen for ${answeredQuestionsList.answeredQuestions[0].questionIndex}  was  ${answeredQuestionsList.answeredQuestions[0].answerScore}');
    //print('${answeredQuestionsList.answeredQuestions[1].questionIndex}');
    //print(answeredQuestionsList.answeredQuestions[2]);
    resultStr='default';
    if (answeredQuestionsList.answeredQuestions[0].questionIndex == 1)
      {
        if (answeredQuestionsList.answeredQuestions[0].answerScore ==5)
          {
            resultStr='The first question was answered with a 5';
          }
      }


    /* YES to 1 AND (YES to any of 2,3,4,5)), AND
YES to any question in 6(local) or 7 or 8 AND NO in 9:
Result= Outcome B; Primary Care
YES to 1 AND (YES to any of 2,3,4,5)), AND
YES to any question in 6( national or international or both), AND YES/NO in 9:
Result = Outcome B; Primary Care
YES to 1 AND (NO to any of 2,3,4,5)), AND YES 10
Result = Outcome B; Primary Care
NO to 1 and YES 2,3,4 or 5 AND YES 10
Result = Outcome B Primary Care */


    return resultStr;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(resultString)),
    );
  }
}