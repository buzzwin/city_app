import 'package:flutter/material.dart';


class Answer extends StatelessWidget {
  final Function selectHandler;
  final String amswerText;

  Answer(this.selectHandler, this.amswerText);
//#B22222	rgb(178,34,34)

  @override
  Widget build(BuildContext context) {
    if (this.amswerText == "Yes") {
      return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
                color: Colors.green[900],
                textColor: Colors.white,
                child: Text(amswerText, style: TextStyle(fontSize: 40),),
                onPressed: selectHandler),
          )
      );
    }
    else
      {
        return Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                  color: Colors.red[900],
                  textColor: Colors.white,
                  child: Text(amswerText, style: TextStyle(fontSize: 40),),
                  onPressed: selectHandler),
            )
        );
      }
  }
}
