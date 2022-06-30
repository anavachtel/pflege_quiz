import 'package:flutter/material.dart';

import '../models/category.dart';
import 'appcolors.dart';

class Utils {

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
}