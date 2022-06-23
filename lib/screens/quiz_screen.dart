import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../widgets/question_item.dart';

class QuizScreen extends StatefulWidget {


  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : Icon(
          Icons.clear,
          color: Colors.red,
        ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == DUMMY_QUESTIONS.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= DUMMY_QUESTIONS.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
  //  final routeArgs = ModalRoute.of(context)!.settings.arguments;
 //   final categoryId = routeArgs!['id'];
  //  final categoryQuestion = DUMMY_QUESTIONS.where((question) {
   //   return question.category.contains(categoryId!);
   // }).toList();
    //   return  Scaffold(
    //    appBar: AppBar(title: Text('Question$_questionIndex')
     //     ,),

    //    body:
    return Text('Quiz');

   //         ListView.builder(

    //        itemBuilder: (ctx, index) {


       //   return QuestionItem(
        //    id: categoryQuestion[index].id,
        //    question: categoryQuestion[index].question,
        //    category: categoryQuestion[index].category,
        //    answers: categoryQuestion[index].answers,
    //        answers: categoryQuestion[index].answers,
     //     );







/**
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    */

  }
}