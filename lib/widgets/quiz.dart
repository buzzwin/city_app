import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import '../models/quizitem.dart';

class Quiz extends StatelessWidget {
  //final List<Map<String, Object>> questionsmap;
  final int questionIndex;
  final Function answerQuestion;
  final List<QuizItem> quizItems;

  Quiz({
    @required this.quizItems,
    // this.questionsmap,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  Widget getAnswerWidgets()
  {
    //return new Column(children: (questionsmap[this.questionIndex]['answers'] as List<Map<String, Object>>).map((answer) => new Answer(()=> this.answerQuestion(answer['score']),answer['text'])).toList());
  //print(this.quizItems[questionIndex]);
    return new Column(children: (quizItems[this.questionIndex].answers).map(
            (answer) => new Answer(
                    ()=> this.answerQuestion(
                        answer['score'], this.quizItems[questionIndex]
                    ),answer['text']
            )
    ).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Question(
            //questionsmap[this.questionIndex]['questionText']
              quizItems[this.questionIndex].question
          ),
          getAnswerWidgets(),
        ]
    );
  }
}
