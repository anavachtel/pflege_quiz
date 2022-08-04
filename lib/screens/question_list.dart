import 'package:flutter/material.dart';
import 'package:quiz_app/screens/selected_question_page.dart';

import 'package:provider/provider.dart';

import '../helpers/appcolors.dart';

import '../models/category.dart';
import '../services/category_selection_service.dart';
import '../widgets/question_card.dart';

class QuestionListPage extends StatelessWidget {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fragen',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.MAIN_COLOR,
          centerTitle: true,
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,)),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: selectedCategory!.questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return QuestionCard(
                        question: selectedCategory!.questions[index],
                        onCardClick: () {
                          catSelection.selectedQuestion =
                              selectedCategory!.questions[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectedQuestionPage()));
                        });
                  },
                ))
              ],
            ),
          ],
        ));
  }
}
