import 'package:flutter/material.dart';

import 'package:meals_app/screens/splahpage.dart';
import 'package:meals_app/screens/welcome_page.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomePage(),)
  ));

}





