import 'package:flutter/material.dart';


class Answer extends StatelessWidget {
  final Function selectHandler;
  final String amswerText;

  Answer(this.selectHandler, this.amswerText);
//#B22222	rgb(178,34,34)

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          color: Colors.pink[900],
          textColor: Colors.white,
          child: Text(amswerText),
          onPressed: selectHandler)
    );
  }
}
