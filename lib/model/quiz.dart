import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/material/list_tile.dart';

class Quiz {
  String id;
  String question;
  List<String> options;
  int correctOptionIndex;

  Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  factory Quiz.fromJson(QueryDocumentSnapshot query) {
    return Quiz(
      id: query.id,
      question: query['question'],
      options: List<String>.from(query['options']),
      correctOptionIndex: query['correctOptionIndex'],
    );
  }

  map(ListTile Function(dynamic answer) param0) {}
}
