import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:meals_app/models/subcategory.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String img;
  final List <SubCategory> subcategories;

  const Category(
      {required this.id,
        required this.title,
        this.color = Colors.orange,
        required this.img,
        required this.subcategories, });
}