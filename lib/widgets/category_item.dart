import 'package:flutter/material.dart';

import '../screens/category_question_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String img;
  CategoryItem(this.id, this.title, this.color, this.img);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryQuestionScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0)),
                  child: Image.asset(
                    'assets/covers/${img}',
                    fit: BoxFit.fitWidth,
                  ),
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
      ),
    );
  }
}
