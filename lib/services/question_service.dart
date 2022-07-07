import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meals_app/models/answers.dart';

import '../models/Question.dart';
// Firebase Verbindung, die Fragen zieht
class QuestionService {

  FirebaseFirestore? _instance;

  List<Question> _questions = [];
  List<Answers> _answers = [];
  String answerr = '';
  bool value = false;

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
    var questionn = questionsData['Fragen'] as List;
    var answer = questionn[0] as Map;
    var ques = answer['Frage'] as String;
    var ans = answer['Antwort'] as List;

    /*

    print('data');
    print(questionsData);
    print(question);
    print(answer);
    print(ques);
    print(ans);*/
  //  var answerData = Map.from(questionsData['answers']);
  //  print(answerData);
   // print(answerData);

    for (var catData in questionn) {
      Question question = Question.fromJson(catData);
      _questions.add(question);
      print('questions');
      print(_questions);
    }

    questionsData.forEach((k, v) =>
        print("Key : $k, Value : $v"));

        print("Values from json data:");
    for(int i=0; i<data['Varikosis'].length; i++){
      print(questionn[i]['Frage']);
    }
    for(int i=0; i<answer['Antwort'].length; i++){
      print(ans[i]['antwort']);
    }
  }









    /*  categoriesData.forEach((catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
    });*/
  }
