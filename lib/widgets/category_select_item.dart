
import 'package:flutter/material.dart';

import '../screens/category_question_screen.dart';
import '../screens/question_screen.dart';

class CategorySelectItem extends StatelessWidget {
  final String id;
  final String title;

  const CategorySelectItem({required this.id, required this.title});
  // zum weiterleiten auf nächste Seite
  void selectSubCategory(BuildContext ctx) {
    print(CategoryQuestionScreen.routeName);
    Navigator.of(ctx).pushNamed(
      //WARUM GEHT DAS NICHT?
      CategoryQuestionScreen.routeName,

      arguments: {
        'id' : id,
        'title': title,

      },

    );
/*    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return CategoryQuestionScreen();
      })
    );*/
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
        onTap: () => selectSubCategory(context),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: <Widget> [
                Stack(children: <Widget> [
                  //makes image border radius
                  ClipRRect(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),

                  ),
                    child: Text(title, style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    ),

                  ),



                ],
                ),


              ],

              ),
            )
        ),


      ),
    );
  }
  }
