import 'package:flutter/material.dart';

import 'package:myapp/quiz.dart';
import 'package:myapp/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 7},
        {'text': 'Red', 'score': 4},
        {'text': 'Blue', 'score': 5}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 7},
        {'text': 'Rabit', 'score': 4},
        {'text': 'Mouse', 'score': 5}
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answer": [
        {'text': 'Max', 'score': 10},
        {'text': 'Mosh', 'score': 7},
        {'text': 'Brad', 'score': 4},
        {'text': 'Nick', 'score': 5}
      ]
    },
  ];

  void answerQuestion(int score) {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex += 1;
        _totalScore += score;
      });
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestion: answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
