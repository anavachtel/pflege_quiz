import 'dart:core';

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/question_item.dart';
class CategoryQuestionScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryQuestionScreen({Key? key}) : super(key: key);
//  final String categoryId;
//  final String categoryTitle;

//  CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build (BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryQuestion = DUMMY_QUESTIONS.where((question) {
      return question.category.contains(categoryId!);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!)
        ,),
        body:
        ListView.builder(itemBuilder: (ctx, index) {
          return QuestionItem(
            id: categoryQuestion[index].id,
            question: categoryQuestion[index].question,
            category: categoryQuestion[index].category,
            answers: categoryQuestion[index].answers,
          );
        }, itemCount: categoryQuestion.length,),

        );

  }
}