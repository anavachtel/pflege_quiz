import 'package:flutter/material.dart';
import 'package:meals_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';


import '../helpers/appcolors.dart';


class SplashPage extends StatelessWidget {
  var duration = 3;

  var goToPage = WelcomePage();




  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: duration), ()
    {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });
    return Scaffold(
        body: Container(
          color: AppColors.MAIN_COLOR,
          child: Center(
            child: Icon(Icons.local_hospital_outlined, color: Colors.white, size: 100),
          ),
        )
    );
  }
}