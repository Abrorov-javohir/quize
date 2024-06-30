import 'package:flutter/material.dart';
import 'package:quize/model/quiz.dart';

class PageViewBuilder extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback nextQuestion;

  PageViewBuilder({
    required this.quiz,
    required this.nextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(quiz.question),
        ...quiz.map((answer) {
          return ListTile(
            title: Text(answer),
            onTap: () {
              // Handle answer selection
            },
          );
        }).toList(),
        ElevatedButton(
          onPressed: nextQuestion,
          child: Text('Next'),
        ),
      ],
    );
  }
}
