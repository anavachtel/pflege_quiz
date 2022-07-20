import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/welcome_page.dart';
import 'package:meals_app/services/category_service.dart';
import 'package:provider/provider.dart';


import '../firebase_options.dart';
import '../helpers/appcolors.dart';


class SplashPage extends StatelessWidget {
  var duration = 3;

  var goToPage = WelcomePage();




  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {

    //firebase verbindung
    Firebase.initializeApp(
      name: 'pflege-d3c00',
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      print("completedAppInitialize");
    } );

    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
   // QuestionService qService = Provider.of<QuestionService>(context, listen: false);
    Future.delayed(Duration(seconds: duration), ()
    {
// startseite wird erst angezeigt, wenn Firebase Connection hergestellt ist

      catService.getCategoriesFromCollectionFromFirebase()
      .then((value){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => this.goToPage)
        );
      });

    });
    //Forntend
    return Scaffold(
        body: Container(
          color: AppColors.MAIN_COLOR,
          child: Center(
            child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                  child: Icon(
        Icons.account_circle_rounded,
        color: Colors.white, size: 100)
    ),
    Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        height: 150,
        child: CircularProgressIndicator(
          strokeWidth: 10,
        valueColor: AlwaysStoppedAnimation<Color>(
        Colors.white.withOpacity(0.5)
        )
        ),
      ),
    )
    ],
          ),
        )
    )
    );
  }
}