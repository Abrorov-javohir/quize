import 'package:quize/model/quiz.dart';

final List<Quiz> tests = [
  Quiz(
    id: "1",
    question: 'What is the capital of France?',
    options: ['Berlin', 'Madrid', 'Paris', 'Lisbon'],
    correctOptionIndex: 2,
  ),
  Quiz(
    id: "2",
    question: 'What is 2 + 2?',
    options: ['3', '4', '5', '6'],
    correctOptionIndex: 1, 
  ),
  Quiz(
    id: "3",
    question: 'Who is the winner of the Champions League?',
    options: ['Real Madrid', 'Manchester City', 'Barcelona', 'Bayern Munich'],
    correctOptionIndex: 0, 
  ),
  Quiz(
    id: "4",
    question: 'Who is the president of the USA?',
    options: ['Donald Trump', 'Joe Biden', 'Barack Obama', 'George Bush'],
    correctOptionIndex: 1, 
  ),
  Quiz(
    id: "5",
    question: 'What is the largest planet in our solar system?',
    options: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
    correctOptionIndex: 2, 
  ),
];
