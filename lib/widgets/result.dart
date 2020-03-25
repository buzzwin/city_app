import 'package:cityapp/models/answeredquestionslist.dart';
import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  //final List answeredListMain;
  AnsweredQuestionsList answeredQuestionsList;

  Result(this.resultScore,this.answeredQuestionsList);
  String get resultString {
    var resultStr;
    print('The answered questions list is ${this.answeredQuestionsList}');

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
    resultStr='default';

    return resultStr;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(resultString)),
    );
  }
}