import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final List answeredListMain;

  Result(this.resultScore, this.answeredListMain);

  String get resultString {
    var resultStr;
    if (resultScore > 10)
      {
        resultStr = "You are not good";
      }
    else
      {
        resultStr = "You are good";
      }
    return resultStr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(child: Text(resultString, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),), ),
          FlatButton(child: Text('Reset Quiz'),onPressed: null,)
        ],
      ),
    );
  }
}
