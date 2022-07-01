import 'package:flutter/material.dart';
import 'package:meals_app/models/Question.dart';

import '../models/category.dart';
import 'appcolors.dart';

class Utils {

  static List<Question>getMockedQuestions() {
    return [
      Question(
          question: 'Was ist Diabetes mellitus für eine Erkrankung?',
          option1: 'Herz-Kreislauf-Erkrankung',
          option2: 'Tumorerkrankung',
          correctOption: 'Stoffwechselerkrankung')
    ];
   /*
  static List <Category> getMockedCategories() {
    return [
      Category(name: 'Category1',

          color: AppColors.MAIN_COLOR,
          img: 'stuff',

      ),
      Category(name: 'Category2',

          color: AppColors.MAIN_COLOR,
          img: 'stuff2',

      ),
      Category(name: 'Category3',

          color: AppColors.MAIN_COLOR,
          img: 'stuff3',

      ),


    ];


    }
    */


  }
}