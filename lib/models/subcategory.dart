import 'package:flutter/material.dart';

import 'category.dart';

class SubCategory {

  final String id;
  final String title;
  final Color color;


  const SubCategory(
  {required this.id,
  required this.title,
  this.color = Colors.orange,
  });
  }