import 'package:flutter/material.dart';

import '../helpers/appcolors.dart';
import '../models/Question.dart';
import '../models/Question.dart';
import '../models/category.dart';

class QuestionCard extends StatelessWidget {
  Question question;
  Function onCardClick;

  QuestionCard({required this.question, required this.onCardClick});
  @override
  Widget build(BuildContext context) {
    //gesture detector = tapable
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.lightBlue.withOpacity(0.9), AppColors.MAIN_COLOR,])),
        child: Center(
            child: Text(
          this.question.question.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
