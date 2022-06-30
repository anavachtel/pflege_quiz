import 'package:flutter/material.dart';

import '../helpers/Utils.dart';
import '../models/category.dart';

class SelectedCategoryPage extends StatelessWidget {

  Category selectedCategory;

  SelectedCategoryPage({required this.selectedCategory});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(selectedCategory.name))
      )
    );
  }
}