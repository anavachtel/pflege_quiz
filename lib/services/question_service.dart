import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/Question.dart';
import '../models/category.dart';

class QuestionService {

  FirebaseFirestore? _instance;

  List<Question> _questions = [];

  List<Question> getQuestions() {
    return _questions;
  }
  Future<void> getQuestionsFromCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference questions = _instance!.collection('pflegequiz');

    DocumentSnapshot snapshot = await questions.doc('Fragen').get();
    var data = snapshot.data() as Map;
    var questionsData = data['Varikosis'] as Map <String, dynamic>;

    questionsData.forEach((key, catData) {
      Question question = Question.fromJson(catData);
      _questions.add(question);
    });
    /*  categoriesData.forEach((catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
    });*/
  }
}