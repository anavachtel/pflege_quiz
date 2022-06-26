import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String img;

  const Category(
      {required this.id,
      required this.title,
      this.color = Colors.orange,
      required this.img});
}
