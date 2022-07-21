import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/selected_category_page.dart';
import 'package:meals_app/services/category_service.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../models/category.dart';
import '../services/category_selection_service.dart';
import '../widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {

  List<Category> categories = [];



  @override
  Widget build(BuildContext context) {
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    categories = catService.getCategories();
    /*Stream<List<Category>> getCategory() =>
        FirebaseFirestore.instance
            .collection('pflegequiz')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList()
   */
    return Scaffold(

        body:
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Kategorie auswählen',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                ),
                Expanded(child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(
                        category: categories[index],
                        onCardClick: () {
                          catSelection.selectedCategory = categories[index];
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) =>
                              SelectedCategoryPage()));
                        }
                    );
                  },
                ))
              ],
            ),
          ],
        )
    );







  }

}