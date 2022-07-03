import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meals_app/models/answers.dart';

import '../models/Question.dart';
// Firebase Verbindung, die Fragen zieht
class QuestionService {

  FirebaseFirestore? _instance;

  List<Question> _questions = [];
  List<Answers> _answers = [];

  List<Question> getQuestions() {
    print('getquestions');
    print(_questions);
    return _questions;
  }
  Future<void> getQuestionsFromCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference questions = _instance!.collection('pflegequiz');

    DocumentSnapshot snapshot = await questions.doc('Fragen').get();
    var data = snapshot.data() as Map;
    var questionsData = data['Varikosis'] as Map;
    var question = questionsData['Fragen'] as List;
    /*var answer = question[0] as Map;
    var ques = answer['Frage'] as String;
    var ans = answer['Antwort'] as List;
    print('data');
    print(questionsData);
    print(question);
    print(answer);
    print(ques);
    print(ans);*/
  //  var answerData = Map.from(questionsData['answers']);
  //  print(answerData);
   // print(answerData);

    for (var catData in question) {
      Question question = Question.fromJson(catData);
      _questions.add(question);
      print(_questions);
    }




    /*  categoriesData.forEach((catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
    });*/
  }
}