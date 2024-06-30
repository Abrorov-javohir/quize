import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quize/main.dart';
import 'package:quize/views/add_test.dart';


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  bool isAnswered = false;
  bool isCorrect = false;
  int correctAnswersCount = 0;
  int remainingTime = 5;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        nextQuestion();
      }
    });
  }

  void checkAnswer(int selectedIndex) {
    setState(() {
      isAnswered = true;
      isCorrect =
          tests[currentQuestionIndex].correctOptionIndex == selectedIndex;
      if (isCorrect) {
        correctAnswersCount++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < tests.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        isCorrect = false;
        remainingTime = 10;
        startTimer();
      } else {
        showResult();
      }
    });
  }

  void showResult() {
    timer?.cancel();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text(
              'You answered $correctAnswersCount out of ${tests.length} questions correctly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final test = tests[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              test.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...List.generate(test.options.length, (index) {
              return ListTile(
                title: Text(test.options[index]),
                leading: Radio<int>(
                  value: index,
                  groupValue: isAnswered ? test.correctOptionIndex : null,
                  onChanged: isAnswered
                      ? null
                      : (value) {
                          if (value != null) checkAnswer(value);
                        },
                ),
              );
            }),
            SizedBox(height: 20),
            if (isAnswered)
              Text(
                isCorrect ? 'Correct!' : 'Incorrect!',
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontSize: 18,
                ),
              ),
            SizedBox(height: 20),
            if (!isAnswered)
              Text(
                'Time left: $remainingTime seconds',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isAnswered ? nextQuestion : null,
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}
