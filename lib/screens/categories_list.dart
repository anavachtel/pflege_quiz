import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/';
import 'package:meals_app/screens/selected_category_page.dart';

import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {

  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    /*Stream<List<Category>> getCategory() =>
        FirebaseFirestore.instance
            .collection('pflegequiz')
            .snapshots()
            .map((snapshot) =>
            snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList()
   */     );
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title:
          Text('Categories'
          ),
        ),
        body:
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Select a category',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                ),
                Expanded(child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(
                        category: categories[index],
                        onCardClick: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) =>
                              SelectedCategoryPage(selectedCategory: Utils
                                  .getMockedCategories()[0],)));
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