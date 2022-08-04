import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/profileUser.dart';
import 'package:quiz_app/services/profile_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/appcolors.dart';
import '../services/auth.dart';

class Profile extends StatelessWidget {
  User? currentProfile = FirebaseAuth.instance.currentUser;

  final AuthService _auth = AuthService();

  late String? email = currentProfile?.email.toString();

  late String? uid = currentProfile?.uid.toString();

  final Uri _url =
      Uri.parse('https://digitale-akademie-pflege.de/login/index.php?');

  List<ProfileUser> profil = [];

  @override
  Widget build(BuildContext context) {
    ProfileService profilService =
     Provider.of<ProfileService>(context, listen: false);

    profil = profilService.getProfile();

    return Scaffold(
        body: Container(
            child: Stack(children: [
      Positioned.fill(
        child: Opacity(
            opacity: 0.6,
            child: Image.asset(
                'assets/imgs/pexels-sharon-mccutcheon-1148399.jpg',
                fit: BoxFit.cover)),
      ),
      Column(children: [
        const SizedBox(
          height: 45.0,
        ),
        Container(
            margin:
                const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
              "Erstelldatum: ${profil.elementAt(0).created?.substring(0, 10)}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.lightGreen.withOpacity(0.9),
                      AppColors.MAIN_COLOR,
                    ])),
            child: GestureDetector(
              child: Text(
                "Moodle öffnen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: _launchUrl,
            ))
      ])
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
