import 'package:flutter/material.dart';

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
          margin: EdgeInsets.all(20),
          height: 120,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.lightBlue.withOpacity(0.9),
                            Colors.blue
                          ])),
                ),
              ),
              Positioned(
                bottom: 27,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(this.question.question.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
