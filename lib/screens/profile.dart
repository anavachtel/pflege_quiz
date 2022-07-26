import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/FirebaseUser.dart' as FbU;
import 'package:meals_app/models/loginuser.dart';
import 'package:meals_app/models/profileUser.dart';
import 'package:meals_app/screens/login.dart';
import 'package:meals_app/screens/welcome_page.dart';
import 'package:meals_app/services/profile_service.dart';
import 'package:provider/provider.dart';

import '../helpers/appcolors.dart';
import '../services/auth.dart';

class Profile extends StatelessWidget {
  User? currentProfile = FirebaseAuth.instance.currentUser;

  final AuthService _auth = AuthService();

  late String? email = currentProfile?.email.toString();

  late String? uid = currentProfile?.uid.toString();

  List<ProfileUser> profil = [];

  @override
  Widget build(BuildContext context) {
    ProfileService profilService =
        Provider.of<ProfileService>(context, listen: false);

    profil = profilService.getProfile();

    return Scaffold(
        appBar: AppBar(
          title: Text("Dein Profil"),
          actions: [
            IconButton(
                icon: Icon(Icons.follow_the_signs_outlined),
                onPressed: () async {
                  profilService.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                  //code to execute when this button is pressed
                })
          ],
          backgroundColor: AppColors.MAIN_COLOR,
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(
            height: 45.0,
          ),
          Container(
              margin:
                  const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.lightBlue.withOpacity(0.9),
                        AppColors.MAIN_COLOR,
                      ])),
              child: Center(
                  child: Text(
                "Profilname: " + profil.elementAt(0).profilname.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ))),
          const SizedBox(
            height: 25.0,
          ),
          Container(
              margin:
                  const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.lightBlue.withOpacity(0.9),
                        AppColors.MAIN_COLOR,
                      ])),
              child: Center(
                  child: Text(
                "Emailadresse: " + profil.elementAt(0).email.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ))),
          const SizedBox(
            height: 25.0,
          ),
          Container(
              margin:
                  const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.lightBlue.withOpacity(0.9),
                        AppColors.MAIN_COLOR,
                      ])),
              child: Center(
                  child: Text(
                "Erstelldatum: " + profil.elementAt(0).created.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              )))
        ])));

/*

          Row(children: [
            Text('Profil'),
            const SizedBox(
              height: 25.0,
            ),
            // Text(email.toString()),

            Text(profil.elementAt(0).profilname.toString()),
            Text(profil.elementAt(0).email.toString()),
            Text(profil.elementAt(0).created.toString()),

            /*Expanded(
              child: ListView.builder(
            itemCount: profil.length,
            itemBuilder: (BuildContext context, int index) {
              Text(profil.toString());
            },
            */
          ])
        ],
      ),
    ));


    */
  }
}
