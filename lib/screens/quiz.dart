import 'package:flutter/material.dart';
import 'package:meals_app/services/question_service.dart';
import 'package:provider/provider.dart';

import '../models/Question.dart';

class Quiz extends StatelessWidget {

  List<Question> questions = [];


  @override
  Widget build(BuildContext context) {
    QuestionService qService = Provider.of<QuestionService>(context, listen: false);
    questions = qService.getQuestions();
    return Scaffold(
      appBar: AppBar(
      title: Text(
      'Quiz',),),
    body:
    ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
    return Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right:0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ]
                    )
                ),

              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(this.questions.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),),

                  ],
                ),
              ),
            )
          ],
        )
    );
    }
    )
    );


  }

}