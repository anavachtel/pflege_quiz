import 'package:flutter/material.dart';

import './models/category.dart';
import 'models/question.dart';

const DUMMY_CATEGORIES = [
  Category(
      id: 'c1', title: 'Varikosis', color: Colors.purple, img: 'angular.png'),
  Category(
      id: 'c2',
      title: 'Diabetis Mellitus',
      color: Colors.red,
      img: 'firestore.png'),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png'),
  Category(id: 'c4', title: 'Diabeti', color: Colors.red, img: 'firebase.png'),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png'),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png')
];


const DUMMY_QUESTIONS = [
  Question(
      id: 'q1',
      category: 'c2',
      question:
          'Welche der folgenden Symptome sind typisch für einen Diabetes mellitus?',
      answers: [
        {'answerText': 'Starker Juckreiz', 'score': true},
        {'answerText': 'Ödembildung', 'score': false},
        {'answerText': 'Diarrhoe', 'score': false},
      ]),
  Question(
      id: 'q2',
      category: 'c2',
      question: 'Was ist Diabetes mellitus für eine Erkrankung?',
      answers: [
        {'answerText': 'Herz-Kreislauf-Erkrankung', 'score': false},
        {
          'answerText': 'Erkrankung des Blutes und des blutbildenden Systems',
          'score': false
        },
        {'answerText': 'Stoffwechselerkrankung', 'score': true},
      ]),
  Question(
      id: 'q3',
      category: 'c1',
      question:
          'Zu welcher Prophylaxe gehört das Anlegen der Kompressionsstrümpfe?',
      answers: [
        {'answerText': 'Sturzprophylaxe', 'score': false},
        {'answerText': 'Thromboseprophylaxe', 'score': true},
        {'answerText': 'Dehydratationsprophylaxe', 'score': false},
      ]),
];
