import 'package:flutter/material.dart';
import 'package:quiz_app/helpers/appcolors.dart';
import 'package:quiz_app/screens/question_list.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:quiz_app/services/category_selection_service.dart';
import 'package:provider/provider.dart';

import '../models/Question.dart';
import '../models/category.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category? selectedCategory;
  Question? selectedQuestion;

  // SelectedCategoryPage({required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory!;
//selectedQuestion = catSelection.selectedQuestion!;

    //  QuestionService qService = Provider.of<QuestionService>(context, listen: false);
    // qService.getQuestionsFromCollectionFromFirebase(selectedCategory);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory!.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.MAIN_COLOR,
        ),
        body: Container(
            color: Colors.black,
            child: Stack(children: [
              Positioned.fill(
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                        'assets/imgs/pexels-sharon-mccutcheon-1148399.jpg',
                        fit: BoxFit.cover)),
              ),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          // Respond to button press
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        selectedCategory!.title.toString()),
                                    content:
                                        Text(selectedCategory!.text.toString()),
                                  ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.MAIN_COLOR,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: const Text(
                          'Fallbeispiel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                                  builder: (context) => QuestionListPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.MAIN_COLOR,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: const Text(
                          'Fragen',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          // Respond to button press
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Quiz()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.MAIN_COLOR,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: const Text(
                          'Quiz',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ))
            ])));
  }
}
