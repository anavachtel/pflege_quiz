import 'package:flutter/material.dart';
import 'package:meals_app/services/question_service.dart';
import 'package:provider/provider.dart';

import '../models/Question.dart';
import '../models/answers.dart';
import '../widgets/answer.dart';

class Quiz extends StatefulWidget {

  @override
  _QuizState createState() => _QuizState();

}
  class _QuizState extends State<Quiz> {
  List<Question> questions = [];
  List<Answers> answers = [];
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

  //when the quiz ends
  if (_questionIndex + 1 == questions.length) {
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
  if (_questionIndex >= questions.length) {
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
    QuestionService qService = Provider.of<QuestionService>(context, listen: false);
    questions = qService.getQuestions();




  return Scaffold(
  appBar: AppBar(
  title: const Text(
  'Quiz',
  style: TextStyle(color: Colors.white),
  ),
  centerTitle: true,
  ),
  body: Center(
  child: Column(
  children: [
  Row(
  children: [
  if (_scoreTracker.isEmpty)
  const SizedBox(
  height: 25.0,
  ),
  if (_scoreTracker.isNotEmpty) ..._scoreTracker
  ],
  ),
  const SizedBox(
  height: 25.0,
  ),
  Container(
  width: double.infinity,
  height: 130.0,
  margin: const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
  decoration: BoxDecoration(
  color: const Color(0xffbdaf6f7),
  borderRadius: BorderRadius.circular(20.0),
  ),
  child: Center(
  child: Text(
  questions[_questionIndex].question.toString(),
  textAlign: TextAlign.center,
  style: const TextStyle(
  fontSize: 20.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  ),
    ...(answers)
        .map(
      (answer) => Answer(
        answerColor: answerWasSelected
        ? questions[_questionIndex].answers as bool
            ? Colors.green
            : Colors.red
            : Colors.white,
        answerText: questions[_questionIndex].answers as String,
        answerTap: () {
          answerTap:
              () {
            // if answer was already selected then nothing happens onTap
            if (answerWasSelected) {
              return;
            }
            //answer is being selected
            _questionAnswered(questions[_questionIndex].answers as bool);
          };
        })
      ),


    /*(answer) => Answers(
    answer: answer,
    value: value)*/
  /*(answer) => Answer(
  answerText: Answers[answer].toString(),
  answerColor: answerWasSelected
  ? answer.values as bool
  ? Colors.green
      : Colors.red
      : Colors.white,*/
 /* answerTap: () {
  // if answer was already selected then nothing happens onTap
  if (answerWasSelected) {
  return;
  }
  //answer is being selected
  _questionAnswered(answer.values as bool);
  },
  ),
  ),*/
  const SizedBox(height: 20.0),
  ElevatedButton(

  style: ButtonStyle(
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 120, vertical: 20)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30.0),

  ),

  ),

  ),


  onPressed: () {
  if (!answerWasSelected) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text(
  'Bitte wähle eine Antwort aus, bevor du mit der nächsten Frage weitermachst.'),
  ));
  return;
  }
  _nextQuestion();
  },
  child: Text(endOfQuiz ? 'Neustart' : 'Nächste Frage'),
  ),
  Container(
  padding: const EdgeInsets.all(20.0),
  child: Text(
  '${_totalScore.toString()}/${questions.length}',
  style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
  ),
  ),
  if (answerWasSelected && !endOfQuiz)
  Container(
  height: 100,
  width: double.infinity,
  color: correctAnswerSelected ? Colors.green : Colors.red,
  child: Center(
  child: Text(
  correctAnswerSelected
  ? 'Richtig!'
      : 'Falsch!',
  style: const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  ),
  ),
  ),
  ),
  if (endOfQuiz)
  Container(
  height: 100,
  width: double.infinity,
  color: const Color(0xffbdaf6f7),
  child: Center(
  child: Text(
  _totalScore > 4
  ? 'Glückwunsch! Dein Score ist: $_totalScore'
      : 'Dein Score ist: $_totalScore.',
  style: TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: _totalScore > 4 ? Colors.green : Colors.red,
  ),
  ),
  ),
  ),
  ],
  ),
  ),
  );
  }
  }
