import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Casestudy {
  //String? title;

  // List<Answers>? answers;

/*

  String? title;
  String? text;
  List<dynamic>? study;

  Casestudy({required this.title, required this.text, required this.study});

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
    print(title);
    print(text);

    return '$title '
        '$text';
  }

  factory Casestudy.fromJson(Map<String, dynamic> json) {
    print('json');
    print(json['study'] as String);
    print(json['text'] as String);
    print(json['title'] as String);

    return Casestudy(
        title: json['title'] as String,
        text: json['text'] as String,
        study: json['study'] as List);

    //Answers.fromJson(json['answers']));
  }

  getTitle(json) {
    title = json['title'] as String;
  }

  getText(json) {
    text = json['text'] as String;
  }

  static List<Casestudy> fromJsonArray(List<dynamic> jsonArray) {
    List<Casestudy> casestudyFromJson = [];
    print('list created');
    jsonArray.forEach((jsonData) {
      print(jsonData);
      casestudyFromJson.add(Casestudy.fromJson(jsonData));
    });
    print('casestudyFromJson');
    print(casestudyFromJson);
    return casestudyFromJson;
  }

//  String toJson() => json.encode(toMap());

}

*/
}
