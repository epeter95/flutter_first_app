import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  const Result(this.totalScore);

  String get resultPhrase {
    var resultText = 'You did it!';
    if(totalScore <=8){
      resultText = 'You are awesome and innocent';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(resultPhrase,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
    ));
  }
}
