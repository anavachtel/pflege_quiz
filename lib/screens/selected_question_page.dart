import 'package:flutter/material.dart';
import 'package:meals_app/helpers/appcolors.dart';
import 'package:meals_app/models/Question.dart';
import 'package:meals_app/screens/quiz.dart';

import '../models/category.dart';
import 'fragen.dart';

class SelectedQuestionPage extends StatelessWidget {
  Question selectedQuestion;

  SelectedQuestionPage({required this.selectedQuestion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Frage', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
              const SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(
                    bottom: 10.0, left: 30.0, right: 30.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xffbdaf6f7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    selectedQuestion.question.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]))));
  }
}
