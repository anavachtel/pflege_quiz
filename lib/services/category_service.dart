import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/category.dart';

class CategoryService {

  FirebaseFirestore? _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }
  Future<void> getCategoriesFromCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference categories = _instance!.collection('pflegequiz');

    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories'] as Map <String, dynamic>;

    categoriesData.forEach((key, catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
    });
  /*  categoriesData.forEach((catData) {
      Category cat = Category.fromJson(catData);
      _categories.add(cat);
    });*/
  }
}