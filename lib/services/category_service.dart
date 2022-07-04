import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/category.dart';

//stellt die Firebase connection zu Kategorien her

class CategoryService {
  FirebaseFirestore? _instance;

  //leere liste
  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  // wird am Anfang in Spashpage aufgerufen
  Future<void> getCategoriesFromCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference categories = _instance!.collection('pflegequiz');

    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories'] as Map<String, dynamic>;
    var categoryLimit = 3;

    //iteriert durch Kategorien und befüllt Liste
    categoriesData.forEach((key, catData) {
      Category cat = Category.fromJson(catData);

      _categories.add(cat);
      if (_categories.length > categoryLimit) {
        _categories.removeRange(2, 3);
        //_categories.clear();
      }
    });
  }
}
