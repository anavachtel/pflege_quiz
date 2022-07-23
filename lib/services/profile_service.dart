import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/models/profileUser.dart';
import 'package:meals_app/screens/profile.dart';

import '../models/category.dart';

//stellt die Firebase connection zu Kategorien her

class ProfileService {
  FirebaseFirestore? _instance;

  //leere liste
  List<ProfileUser> _profiles = [];

  List<ProfileUser> getProfile() {
    return _profiles;
  }

  User? currentProfile = FirebaseAuth.instance.currentUser;

  late String? uid = currentProfile?.uid;

  // wird am Anfang in Spashpage aufgerufen
  Future<List?> getProfileFromCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference profile = _instance!.collection('users');

    final userDoc = await profile.doc(uid).get();

    DocumentSnapshot snapshot =
        await profile.doc('bnEZ6WUtdHVOaRcIyRJjNNhEUqJ2').get();
    var data = snapshot.data() as Map;
    var emailData = data['email'];
    var profilnameData = data['profilname'];
    var createdData = data['created'];
    var uidData = data['uid'];

    //iteriert durch Kategorien und befüllt Liste
    createdData.forEach((data) {
      ProfileUser profile = ProfileUser.fromJson(data);

      _profiles.add(emailData);
      _profiles.add(profilnameData);
      _profiles.add(createdData);
      _profiles.add(uidData);

      print(_profiles);
      //_categories.clear();
    });
  }
}

/*
    final userDoc = await profile.doc('$uid').get();
    // var data = snapshot.data() as Map;
    var userEmail = userDoc.get('email');
    var userCreated = userDoc.get('created');
  
*/
   

   /* var profilesData = data as List<dynamic>;
    var profileEmail = data['email'] as List<dynamic>;

    profilesData.forEach((profData) {
      ProfileUser prof = ProfileUser.fromJson(profData);

      //if (prof.uid == uid) {
      _profiles.add(prof);
      print(_profiles);
      print("'" + uid! + "'");
      //}
    });
  }
}

*/