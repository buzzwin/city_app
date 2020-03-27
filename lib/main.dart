import 'package:cityapp/models/answeredquestionslist.dart';
import 'package:cityapp/models/answeredquestion.dart';
import 'package:cityapp/widgets/quiz.dart';
import 'package:cityapp/models/quizitem.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'widgets/quiz.dart';
import 'widgets/result.dart';
import 'package:geolocator/geolocator.dart';
import 'widgets/maps.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(CrisisApp());
class CrisisApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CrisisAppState();
  }
}
class _CrisisAppState extends State<CrisisApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  var answeredList=[];
  var answeredQuestionsList = AnsweredQuestionsList();


  var _opacity = 1.0;



  Position _currentPosition;


  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getCurrentLocation());
  }


  final List<QuizItem> quizItems = [
    QuizItem(
      itemIndex: 1,
      question: "Are you good ?",
      answers: [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ]
    ),
    QuizItem(
        itemIndex: 2,
        question: "Is it raining ?",
        answers: [
          {'text': 'Yes', 'score': 10},
          {'text': 'No', 'score': 5},
        ]
    )
  ];

  var questionsmap = [
    {
      'questionText': 'Do you have a temperature of 99.6 or higher?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Do you have a cough?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
  ];

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void answerQuestion(int score , QuizItem quizItem) {
      //print('The score is : ${score}');
      //print('The quizItem is : ${quizItem}');

    setState(() {
      //if (_questionIndex < questionsmap.length - 1) {
      if (_questionIndex < quizItems.length) {
        _questionIndex++;

        var answeredQuestion = AnsweredQuestion();
        //totalScore = totalScore + score;
        answeredQuestion.answerScore = score;
        answeredQuestion.questionIndex = quizItem.itemIndex;


        //print(answeredQuestion);

        //print('The answeredQuestion is : ${answeredQuestion}');

        answeredQuestionsList.addItem(answeredQuestion);

        //answeredList.add(score);
       // print(answeredList);
      }
      else {
        //print(totalScore);
       // _questionIndex = 0;
        print("No more questions");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.pink[900],
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             //Image.asset('images/logo.png', fit:BoxFit.fitWidth, height: 100,),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFFFFFFE),
                boxShadow:[
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, _opacity),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  )
                ],
            ),
              child: Column(
                children: <Widget>[
                  _questionIndex < quizItems.length?Quiz(quizItems: quizItems ,questionIndex: _questionIndex,answerQuestion: answerQuestion):Result(totalScore, answeredQuestionsList),
                  if (_currentPosition != null)
                    Text(
                        "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
                  //MapSample(),
                ],
              )),
        )
      ),
    );
  }
}