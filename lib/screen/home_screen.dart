import 'package:flutter/material.dart';
import 'package:quize/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://tricky-photoshop.com/wp-content/uploads/2017/08/final-1.png"),
          )
        ],
        title: const Text("Quiz App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );
          },
          child: Text('Start Quiz'),
        ),
      ),
    );
  }
}
