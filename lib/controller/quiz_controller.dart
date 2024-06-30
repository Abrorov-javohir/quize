import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quize/service/quiz_firebase_service.dart';

class ProductController extends ChangeNotifier {
  final firebaseController = QuizFirebaseService();
  
  Stream<QuerySnapshot> get list => firebaseController.getProducts();
}
