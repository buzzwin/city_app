import 'package:cityapp/models/answerequestion.dart';

class AnsweredQuestionsList{
 List<AnsweredQuestion> _answeredQuestions =[];

AnsweredQuestionsList();

 List<AnsweredQuestion> get answeredQuestions => _answeredQuestions;

 set answeredQuestions(List<AnsweredQuestion> value) {
   _answeredQuestions = value;
 }
 
void  addItem(answeredQuestion){
   print('The answered question is : ${answeredQuestion}');
   this._answeredQuestions.add(answeredQuestion);
 }

 @override
  String toString() {
    // TODO: implement toString
   return _answeredQuestions.toString();
    //
  }

}