import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/CaseStudy.dart';
import '../models/Question.dart';
import '../models/category.dart';

class CategorySelectionService extends ChangeNotifier {
  FirebaseFirestore? _instance;
  Category? _selectedCategory;
  Question? _selectedQuestion;
  Casestudy? _selectedCaseStudy;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  Question? get selectedQuestion => _selectedQuestion;
  set selectedQuestion(Question? value) {
    _selectedQuestion = value;
    notifyListeners();
  }

  Casestudy? get selectedCaseStudy => _selectedCaseStudy;
  set selectedCaseStudy(Casestudy? value) {
    _selectedCaseStudy = value;
    notifyListeners();
  }
}
