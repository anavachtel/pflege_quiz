import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Question.dart';
import 'package:meals_app/screens/selected_category_page.dart';
import 'package:meals_app/screens/selected_question_page.dart';

import 'package:meals_app/services/category_service.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../models/category.dart';
import '../services/question_service.dart';
import '../widgets/category_card.dart';
import '../widgets/question_card.dart';

class QuestionListPage extends StatelessWidget {
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    QuestionService catService =
        Provider.of<QuestionService>(context, listen: false);
    questions = catService.getQuestions();
    /*Stream<List<Category>> getCategory() =>
        FirebaseFirestore.instance
            .collection('pflegequiz')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList()
   */
    return Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Select a Question',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return QuestionCard(
                        question: questions[index],
                        onCardClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectedQuestionPage(
                                        selectedQuestion:
                                            catService.getQuestions()[index],
                                      )));
                        });
                  },
                ))
              ],
            ),
          ],
        ));
  }
}
