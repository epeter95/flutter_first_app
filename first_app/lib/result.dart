import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetHandler;
  const Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: resetHandler,
            child: const Text('Do it Again!'),
          )
        ],
      ),
    );
  }
}
