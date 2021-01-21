import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;

  final Function reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome innocent!!';
    } else if (resultScore <= 12) {
      resultText = 'You are likeable';
    } else if (resultScore <= 36) {
      resultText = 'You are ... strange!!???';
    } else {
      resultText = 'You are so bad!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      FlatButton(
        child: Text('Reset'),
        onPressed: reset,
        textColor: Colors.blue,
      )
    ]);
  }
}
