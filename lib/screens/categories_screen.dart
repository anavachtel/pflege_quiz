import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_select_item.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

// SEite wird beim Aufruf von TabsScreen aufgerufen

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
            catData.id, catData.title, catData.color, catData.img),
      )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}