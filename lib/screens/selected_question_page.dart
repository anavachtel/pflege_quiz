import 'package:flutter/material.dart';
import 'package:meals_app/helpers/appcolors.dart';
import 'package:meals_app/models/Question.dart';
import 'package:meals_app/screens/quiz.dart';
import 'package:meals_app/widgets/answer.dart';
import 'package:provider/provider.dart';

import '../models/answers.dart';
import '../models/category.dart';
import '../services/category_selection_service.dart';
import '../widgets/question_card.dart';

class SelectedQuestionPage extends StatelessWidget {
  Question? selectedQuestion;
  Color? color;

  //SelectedQuestionPage({required this.selectedQuestion});
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedQuestion = catSelection.selectedQuestion!;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Frage',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.MAIN_COLOR,
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
                    selectedQuestion!.question!.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ...(selectedQuestion!.answers! as List<dynamic>).map(
                (answer) => Answer(
                  answerText: answer['answer'].toString(),
                  answerColor:
                      answer['value'] == true ? Colors.green : Colors.red,
                  answerTap: () {},
                ),
              ),
              /* Answer(
                  answerText: selectedQuestion.answers.toString(),
                  answerColor: Colors.blue,
                  answerTap: () {
                    // if answer was already selected then nothing happens onTap
                  })*/
              /*
              ListView.builder(
                  itemCount: selectedQuestion.answers?.length,
                  itemBuilder: (ctx, index) => Column(children: [
                        ListTile(
                          title: Text(selectedQuestion.answers![index]['answer']
                              as String),
                        )
                      ]))

                      */
            ]))));
  }
}
