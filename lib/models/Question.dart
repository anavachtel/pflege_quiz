import 'dart:convert';

import 'package:flutter/rendering.dart';

import 'answers.dart';

class Question {
  String? question;
  List<dynamic>? answers;

  Question({required this.question, required this.answers});

  @override
  String toString() {
    return '$answers'
        '$question';
  }

  factory Question.fromJson(Map<String, dynamic> json) {

    return Question(
        question: json['question'],
        answers: json['answers']);

  }

  static List <Question> fromJsonArray(List<dynamic> jsonArray) {
    List<Question> questionsFromJson = [];
    //iterate through questions
    for (var jsonData in jsonArray) {
      questionsFromJson.add(Question.fromJson(jsonData));
    }

    return questionsFromJson;
  }



}
