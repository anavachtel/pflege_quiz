import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/selected_category_page.dart';
import 'package:quiz_app/services/category_service.dart';
import 'package:provider/provider.dart';


import '../models/category.dart';
import '../services/category_selection_service.dart';
import '../widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    //get categories from Category Service
    CategoryService catService =
        Provider.of<CategoryService>(context, listen: false);
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    //fill list with categories by calling method
    categories = catService.getCategories();

    //Frontend
    return Scaffold(
        body: Stack(
      children: [
        Column(
          // stretch = full width of phone - padding
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Kategorie auswählen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      )),
            ),
            Expanded(
              //listview
                child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                    category: categories[index],
                    //select category with tap
                    onCardClick: () {
                      catSelection.selectedCategory = categories[index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedCategoryPage()));
                    });
              },
            )
            )
          ],
        ),
      ],
    )
    );
  }
}
