import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  String name;
  Color color;
  String img;


  Category(
      {
        required this.name,
        required this.color,
        required this.img
      }
      );
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        color: Color(int.parse('0xFF' + json['color'])),
        name: json['name'],
        img: json['img'],

        //method from subcategory class



    );
  }
}


  //to map a json structure





