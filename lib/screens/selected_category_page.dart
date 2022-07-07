import 'package:flutter/material.dart';
import 'package:meals_app/helpers/appcolors.dart';
import 'package:meals_app/screens/question_list.dart';
import 'package:meals_app/screens/quiz.dart';
import 'package:provider/provider.dart';

import '../helpers/Utils.dart';
import '../models/category.dart';
import '../services/question_service.dart';
import 'fragen.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category selectedCategory;


  SelectedCategoryPage({required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    QuestionService qService = Provider.of<QuestionService>(context, listen: false);
    qService.getQuestionsFromCollectionFromFirebase(selectedCategory);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory.name),
        ),
        body: Container(
            child: Center(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text(
                    'Fallbeispiel',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.MAIN_COLOR,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(25),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuestionListPage()));
                  },
                  child: Text(
                    'Fragen',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.MAIN_COLOR,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(25),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Quiz()));
                  },
                  child: Text(
                    'Quiz',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.MAIN_COLOR,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(25),
                  )),
            ),
          ],
        ))));
  }
}
