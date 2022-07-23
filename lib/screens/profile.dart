import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/FirebaseUser.dart' as FbU;
import 'package:meals_app/models/loginuser.dart';
import 'package:meals_app/models/profileUser.dart';
import 'package:meals_app/screens/login.dart';
import 'package:meals_app/services/profile_service.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  User? currentProfile = FirebaseAuth.instance.currentUser;

  late String? email = currentProfile?.email.toString();

  late String? uid = currentProfile?.uid.toString();

  List<ProfileUser> profil = [];

  @override
  Widget build(BuildContext context) {
    ProfileService profilService =
        Provider.of<ProfileService>(context, listen: false);

    profil = profilService.getProfile();

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Row(children: [
            Text('Profil'),
            const SizedBox(
              height: 25.0,
            ),
            Text(email.toString()),
            Text(profil.toString()),
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
  }
}
