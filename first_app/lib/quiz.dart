import 'dart:ffi';

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;
  const Quiz(this.answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Question(questions[questionIndex]['questionText'] as String),
                  // ... 1 listánk lesz nested list helyett
                  ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
                      .map((answer) {
                    return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
                  }).toList()
                ],
              );
  }
}