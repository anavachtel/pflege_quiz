import 'dart:convert';

import 'package:flutter/rendering.dart';

import 'answers.dart';

class Question {
  String? question;
 // List<Answers>? answers;
  List<dynamic>? answers;

  Question({required this.question, required this.answers});


/*

  Question.fromJson(Map json) {
    question = json['Frage'] ?? '';
    print(json['Frage'].toString());
    answers = (json['answers']).map((v) => Answers.fromJson(v)).map<Answers>();
      }
*/

  /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final answers = this.answers;
    if (answers != null) {
      data['answers'] = answers.map((v) => v.toJson()).toList();
    }
    return data;
  }*/

/*

  Map<dynamic, dynamic> toMap() {
    return {
      'question': question,
      'answers' : answers?.map((x) => x.toMap())?.toList(),
    };
  }

 */
  @override
  String toString() {
    print('muh');
    print(question);
    print(answers);
    return '$answers'
        '$question';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    print('json');
    print(json['question'].toString());
    print((json['answers']));

    return Question(
        question: json['question'],
        answers: json['answers']);
    //Answers.fromJson(json['answers']));
  }

  static List <Question> fromJsonArray(List<dynamic> jsonArray) {
    List<Question> questionsFromJson = [];
    
    jsonArray.forEach((jsonData) {
      print(jsonData);
      questionsFromJson.add(Question.fromJson(jsonData));
    });

    return questionsFromJson;
  }

//  String toJson() => json.encode(toMap());

}
