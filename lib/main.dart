import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/categories_list.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:quiz_app/screens/splahpage.dart';
import 'package:quiz_app/screens/welcome_page.dart';
import 'package:quiz_app/services/category_selection_service.dart';
import 'package:quiz_app/services/category_service.dart';
import 'package:quiz_app/services/login_service.dart';
import 'package:quiz_app/services/profile_service.dart';
import 'package:provider/provider.dart';

import 'helpers/appcolors.dart';
import 'models/category.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        Provider(create: (_) => LoginService()),
        Provider(create: (_) => CategoryService()),
        Provider(create: (_) => ProfileService()),
        ListenableProvider(create: (_) => CategorySelectionService())
        /*Provider(
        create: (_) => QuestionService()),
*/
      ],
      child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'Raleway', primaryColor: AppColors.MAIN_COLOR),
          debugShowCheckedModeBanner: false,
          home: SplashPage(
            duration: 3,
            goToPage: WelcomePage(),
          ))));
}
