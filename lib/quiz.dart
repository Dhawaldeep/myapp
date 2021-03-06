import 'package:flutter/material.dart';
import 'package:myapp/answer.dart';
import 'package:myapp/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;

  final Function answerQuestion;

  final int questionIndex;

  Quiz({this.questions, this.answerQuestion, this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ]
    );
  }
}