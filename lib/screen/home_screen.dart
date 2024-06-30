import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize/controller/quiz_controller.dart';
import 'package:quize/model/quiz.dart';
import 'package:quize/screen/widgets/page_view_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();

  void _nextQuestion() {
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductController>();
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SafeArea(
        child: StreamBuilder(
          stream: controller.list,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No products available"),
              );
            }
            final products = snapshot.data!.docs;

            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final product = Quiz.fromJson(products[index]);
                return PageViewBuilder(
                  quiz: product,
                  nextQuestion: _nextQuestion,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
