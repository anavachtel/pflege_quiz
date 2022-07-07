
import 'dart:convert';


import 'package:flutter/rendering.dart';


import 'answers.dart';

class Question {

  String ?question;

  List ?answers;

  Question(
  {
    required this.question,
    required this.answers
}
      );

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


    return '$answers'
      '$question';
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    print('json');
    print(json['Frage'].toString());
    print(json['Antwort']);



    return Question(
        question: json['Frage'].toString(),
        answers: json['Antwort']);
       //Answers.fromJson(json['answers']));
  }

  void getKeysAndValuesUsingForEach(Map map) {
    // Get all keys and values at the same time using map.forEach
    print('----------');
    print('Get keys and values using map.forEach:');
    map.forEach((key, value) {
      print('Key = $key : Value = $value');
    });
  }


//  String toJson() => json.encode(toMap());





}
