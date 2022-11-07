import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;
  void _answerQuestion() {
    // ez kell ,hogy változzon a képernyőn amit szeretnénk
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\s your favourite animal?',
        'answers': ['Dog', 'Cat', 'Fox', 'Lion']
      },
      {
        'questionText': 'Who\s your favourite instructor?',
        'answers': ['Me', 'You', 'Herold', 'Steve']
      }
    ];
    print(questions[_questionIndex]['questionText']);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Super App!'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String
            ),
            // ... 1 listánk lesz nested list helyett
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
