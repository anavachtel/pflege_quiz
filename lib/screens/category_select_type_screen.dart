
import 'package:flutter/material.dart';
import 'package:meals_app/models/subcategory.dart';
import 'package:meals_app/widgets/category_select_item.dart';

import '../dummy_data.dart';

class CategorySelectTypeScreen extends StatelessWidget{
  static const routeName = '/category-questions-select';

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //      categoryTitle!
            'Category_select_type_screen')
        ,),
      body:
    GridView(
    padding: const EdgeInsets.all(25),
    children: DUMMY_SELECT
        .map(
    (catData) => CategorySelectItem(
      catData.id, catData.title, catData.color
   ),
    )
        .toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 3,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    ),
    )
    );
  }


    }

