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

  var _opacity = 1.0;



  Position _currentPosition;


  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getCurrentLocation());
  }


  final List<QuizItem> quizItems = [
    QuizItem(
      question: "Are you good ?",
      answers: [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ]
    ),
    QuizItem(
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
    {
      'questionText': 'Do you have difficulty breathing?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Do you have a body ache?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Do you have high blood pressure?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Have you traveled in the last 2 weeks?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Do you have a chronic health condition such as diabetes, lung disease or heart disease?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Are you age 65 or older?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Have you had a positive test for the flu or other respiratory viruses in the last 2 weeks?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 5},
      ],
    },
    {
      'questionText': 'Have you had direct contact of a positive carrier within 6 feet or with infectious secretions? (The CDC defines "close contact" as either 1) a "prolonged period of time" spent "within approximately 6 feet (2 meters) or within the room or care area" of an individual who has been positively diagnosed with the virus or 2) "direct contact with infectious secretions." Examples include sharing eating or drinking utensils, close conversation, or kissing, hugging, and other direct physical contact. "Close contact" does not include activities such as walking by a person or briefly sitting across a waiting room or office.)',
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

  void _answerQuestion(int score) {
    setState(() {
      //if (_questionIndex < questionsmap.length - 1) {
      if (_questionIndex < quizItems.length) {
        _questionIndex++;
        totalScore = totalScore + score;
        answeredList.add(score);
        print(answeredList);
      }
      else {
        print(totalScore);
       // _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.pink[900],
          title: Text('Crisis App'),
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
                  _questionIndex < quizItems.length?Quiz(quizItems: quizItems ,questionIndex: _questionIndex,answerQuestion: _answerQuestion):Result(totalScore, answeredList),
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