import 'package:flutter/material.dart';
import 'package:meals_app/screens/splahpage.dart';
import 'package:meals_app/screens/welcome_page.dart';
import 'package:meals_app/services/category_service.dart';
import 'package:meals_app/services/login_service.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
      Provider(
        create: (_) => LoginService()),
      Provider(
        create: (_) => CategoryService()),
        ],
        child:
      MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomePage(),)
  ))
  );

}





