
import 'package:flutter/material.dart';
import 'package:meals_app/services/login_service.dart';
import 'package:provider/provider.dart';


import '../helpers/appcolors.dart';
import 'categories_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class WelcomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                      opacity: 0.3,
                      child: Image.asset('assets/imgs/pexels-sharon-mccutcheon-1148399.jpg',
                          fit: BoxFit.cover)
                  ),

                ),
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //round container widget
                          Center(
                            child: ClipOval(
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  color: AppColors.MAIN_COLOR,
                                  child: Icon(
                                      FontAwesomeIcons.userNurse, color: Colors.white, size: 100),
                                )
                            ),
                          ),
                          SizedBox(height: 50),
                          Text('Welcome',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(height:30),
                          Text('MyApp to learn some stuff',
                              textAlign: TextAlign.center
                              ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ) ),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CategoryListPage())
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              color: AppColors.MAIN_COLOR,
                              padding: EdgeInsets.all(25),
                              child: const Text('Button',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),),


                            ),
                          ),
                          //button
                          Container(
                              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: AppColors.MAIN_COLOR.withOpacity(0.2),
                                      highlightColor: AppColors.MAIN_COLOR.withOpacity(0.2),
                                      onTap: () async {
                                        bool success = await loginService.signInWithGoogle();

                                        if (success) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => CategoryListPage())
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: AppColors.MAIN_COLOR,
                                                width: 4
                                            )
                                        ),
                                        child: const Text('Login',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.MAIN_COLOR,
                                                fontWeight: FontWeight.bold
                                            )
                                        ),

                                      ),


                                    )
                                ),
                              )
                          )

                        ]
                    )
                ),

              ],
            )
        )
    );
  }
}