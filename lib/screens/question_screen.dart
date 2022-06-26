import 'dart:core';

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/question.dart';

class QuestionScreen extends StatelessWidget {

  static const routeName = '/question';

  Widget buildSectionTitle(BuildContext context, String text) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style:
        Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
    return child;
  }
  @override
  Widget build(BuildContext context) {

    final questionId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedQuestion = DUMMY_QUESTIONS.firstWhere((question) => question.id == questionId);
    return Scaffold(
        appBar: AppBar(title: Text('Frage'),),
        body: SingleChildScrollView(
          child: Column(children: <Widget> [
              buildSectionTitle(context, selectedQuestion.question),
          buildContainer(ListView.builder(
            itemCount: selectedQuestion.answers.length,
            itemBuilder: (ctx, index) => Column( children: [
              ListTile(
            title: Text(selectedQuestion.answers[index]['answerText'] as String
            ),

    )
          ]
    )
    )

    )


    ])
    )
    );
  }

}