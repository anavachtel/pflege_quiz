import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/models/CaseStudy.dart';

import 'Question.dart';

class Category {
  String name;
  Color color;
  String img;
  List<Question> questions;
  String? title;
  String? text;
  //List<Casestudy> casestudy;

  Category({
    required this.name,
    required this.color,
    required this.img,
    required this.questions,
    required this.title,
    required this.text,
    //required this.casestudy
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: Color(int.parse('0xFF' + json['color'])),
      name: json['name'],
      img: json['img'],
      questions: Question.fromJsonArray(json['questions']),
      title: json['title'],
      text: json['text'],

      //casestudy: Casestudy.fromJsonArray(json['casestudys']),

      //method from subcategory class
    );
  }
}


  //to map a json structure





