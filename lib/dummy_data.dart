import 'package:flutter/material.dart';
import 'package:meals_app/models/subcategory.dart';

import './models/category.dart';
import 'models/question.dart';



const DUMMY_CATEGORIES = [
  Category(
      id: 'c1', title: 'Varikosis', color: Colors.purple, img: 'angular.png', subcategories: [
    SubCategory(id: 'sc1', title: 'Fallbeispiel'),
    SubCategory(id: 'sc2', title: 'Multiple Choice'),
    SubCategory(id: 'sc3', title: 'Freitext')
  ]),
  Category(
      id: 'c2',
      title: 'Diabetis Mellitus',
      color: Colors.red,
      img: 'firestore.png',
      subcategories: [
        SubCategory(id: 'sc1', title: 'Fallbeispiel'),
        SubCategory(id: 'sc2', title: 'Multiple Choice'),
        SubCategory(id: 'sc3', title: 'Freitext')
      ]),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png', subcategories: [
    SubCategory(id: 'sc1', title: 'Fallbeispiel'),
    SubCategory(id: 'sc2', title: 'Multiple Choice'),
    SubCategory(id: 'sc3', title: 'Freitext')

  ]),
  Category(id: 'c4', title: 'Diabeti', color: Colors.red, img: 'firebase.png', subcategories: [
    SubCategory(id: 'sc1', title: 'Fallbeispiel'),
    SubCategory(id: 'sc2', title: 'Multiple Choice'),
    SubCategory(id: 'sc3', title: 'Freitext')
  ]),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png', subcategories: [
    SubCategory(id: 'sc1', title: 'Fallbeispiel'),
    SubCategory(id: 'sc2', title: 'Multiple Choice'),
    SubCategory(id: 'sc3', title: 'Freitext')
  ]),
  Category(id: 'c3', title: 'Diabeti', color: Colors.red, img: 'firebase.png', subcategories: [
    SubCategory(id: 'sc1', title: 'Fallbeispiel'),
    SubCategory(id: 'sc2', title: 'Multiple Choice'),
    SubCategory(id: 'sc3', title: 'Freitext')
  ])
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
      ], subcategory: 'mc'),
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
      ], subcategory: 'mc'),
  Question(
      id: 'q3',
      category: 'c1',
      question:
          'Zu welcher Prophylaxe gehört das Anlegen der Kompressionsstrümpfe?',
      answers: [
        {'answerText': 'Sturzprophylaxe', 'score': false},
        {'answerText': 'Thromboseprophylaxe', 'score': true},
        {'answerText': 'Dehydratationsprophylaxe', 'score': false},
      ], subcategory: 'mc'),
];
