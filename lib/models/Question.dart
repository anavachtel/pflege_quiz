import 'dart:convert';

import 'package:flutter/rendering.dart';

import 'answers.dart';

class Question {
  String? question;

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
    print(json['Frage'].toString());
    print((json['Antwort']));

    return Question(
        question: json['Frage'].toString().replaceAll("\\n", "\n"),
        answers: json['Antwort']);
    //Answers.fromJson(json['answers']));
  }

//  String toJson() => json.encode(toMap());

}
