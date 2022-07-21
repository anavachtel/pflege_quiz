import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Question.dart';
import 'package:meals_app/screens/selected_category_page.dart';
import 'package:meals_app/screens/selected_question_page.dart';

import 'package:meals_app/services/category_service.dart';
import 'package:provider/provider.dart';

import '../helpers/appcolors.dart';
import '../helpers/utils.dart';
import '../models/category.dart';
import '../services/category_selection_service.dart';
import '../widgets/category_card.dart';
import '../widgets/question_card.dart';
import 'bottom_nav_bar.dart';

class QuestionListPage extends StatelessWidget {


  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;

  /*  QuestionService catService =
    Provider.of<QuestionService>(context, listen: false);
    questions = catService.getQuestions();*/
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
          backgroundColor: AppColors.MAIN_COLOR,

        ),

        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('Frage auswählen',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: selectedCategory!.questions!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionCard(
                            question: selectedCategory!.questions![index],
                            onCardClick: () {
                              catSelection.selectedQuestion = selectedCategory!.questions![index];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectedQuestionPage(

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