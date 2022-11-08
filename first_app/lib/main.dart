import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//_ priváttá varázsolja a publicot
class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 2},
      ]
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 6},
        {'text': 'Fox', 'score': 0},
        {'text': 'Lion', 'score': 8}
      ]
    },
    {
      'questionText': 'Who\s your favourite instructor?',
      'answers': [
        {'text': 'Me', 'score': 10},
        {'text': 'You', 'score': 5},
        {'text': 'Herold', 'score': 7},
        {'text': 'Steve', 'score': 1},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    // ez kell ,hogy változzon a képernyőn amit szeretnénk
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
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
          title: const Text('My Super App!'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                _answerQuestion,
                questions,
                _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
