import 'package:flutter/material.dart';

import '../screens/question_screen.dart';

class QuestionItem extends StatelessWidget {
  final String id;
  final String category;
  final String question;
  final List <Map <String, Object>> answers;

  const QuestionItem({super.key, required this.id, required this.category, required this.question, required this.answers});
  void selectQuestion(BuildContext context) {
    Navigator.of(context).pushNamed(QuestionScreen.routeName,
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
        onTap: () => selectQuestion(context),
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
                    child: Text(question, style: TextStyle(
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