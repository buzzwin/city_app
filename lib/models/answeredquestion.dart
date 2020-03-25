class AnsweredQuestion {
   int _questionIndex;
   int _answerScore;
  AnsweredQuestion();

  @override
  String toString() {
    // TODO: implement toString
    return questionIndex.toString() + " " + answerScore.toString();

    //return super.toString();
  }

   int get answerScore => _answerScore;

   set answerScore(int value) {
     _answerScore = value;
   }

   int get questionIndex => _questionIndex;

   set questionIndex(int value) {
     _questionIndex = value;
   }

}