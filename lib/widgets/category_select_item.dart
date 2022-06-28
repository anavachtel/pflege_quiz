
import 'package:flutter/material.dart';

import '../screens/category_question_screen.dart';
import '../screens/question_screen.dart';

class CategorySelectItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategorySelectItem(this.id, this.title, this.color);
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
    return Material(
        child: InkWell(
          onTap: () => selectSubCategory(context),
          splashColor: Theme.of(context).primaryColor,
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.9),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0)),

                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 5),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ))
                ]),
          ),

        )
    );
      }
  }
