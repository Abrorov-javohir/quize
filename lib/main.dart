import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize/controller/quiz_controller.dart';
import 'package:quize/screen/home_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
