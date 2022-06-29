
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/subcategory.dart';
import 'package:meals_app/widgets/category_select_item.dart';

import '../dummy_data.dart';

class SelectedCategoryScreen extends StatelessWidget {
  static const routeName = '/category-questions-select';



  @override
  Widget build(BuildContext context) {
     final routeArgs = ModalRoute.of(context)!.settings.arguments;
     print(routeArgs);
     final categoryQuestion = DUMMY_QUESTIONS.where((question){
       return question.category.contains(routeArgs);
     }).toList();


 /*   final categoryId = ModalRoute.of(context)!.settings.arguments;

    print(categoryId);

    final selectedCategory = DUMMY_CATEGORIES.where((category) => category.id == categoryId);
    print(selectedCategory);

*/
    return Scaffold(
     appBar: AppBar(),
        body:
        Text('ello')


/*

         id: categoryQuestion[index].id,
          title: categoryQuestion[index].title,
          color: categoryQuestion[index].answers,



      }, itemCount: selectedQuestion.length,),
*/


    );

  }




  /*@override
  Widget build (BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final subcgry = routeArgs['subcategory'];
    print(subcgry);
   */ /* final categoryQuestion = DUMMY_QUESTIONS.where((subcategory){
      return question.category.contains(subcgry);
    }).toList();

    */ /*
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //      categoryTitle!
            'Category_select_type_screen')
        ,),
      body:
      ListView.builder(itemBuilder: (ctx, index) {
        return CategorySelectItem( id: '1', title: 'title', color: Colors.green);

 */ /*         id: categoryQuestion[index].id,
          title: categoryQuestion[index].title,
          color: categoryQuestion[index].answers,
        );

  */ /*
      }, itemCount: subcgry?.length,),

    );

  }  */
  /*@override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final List<SubCategory> subcategory = routeArgs['subcategories'] as List<SubCategory>;
    final categorySub = DUMMY_CATEGORIES.where((category){
      return category.subcategories.contains(categoryId);
    }).toList();
    final a = DUMMY_CATEGORIES.where((category){
      return category.

    }
    print(subcategory);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          //      categoryTitle!
            categoryId!)
        ,),
     body:
      ListView.builder(itemBuilder: (ctx, index) {
        print(categorySub[index].id);
        return CategorySelectItem(
            id: categorySub[index].id, title: categorySub[index].title);
            //    title: categorySub[index].title);

      }, itemCount: categorySub.length,),

    );*/

       /* GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                CategorySelectItem(
                    id: catData.id, title: catData.title, color: catData.color
                ),
          )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        )*/

  }



