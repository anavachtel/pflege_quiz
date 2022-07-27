import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/profileUser.dart';
import 'package:meals_app/screens/profile.dart';
import 'package:meals_app/screens/welcome_page.dart';

import '../models/category.dart';

//stellt die Firebase connection zu Kategorien her

class ProfileService {
  FirebaseFirestore? _instance;

  User? currentProfile = FirebaseAuth.instance.currentUser;
  late String? uid = currentProfile?.uid;
  //leere liste
  List<ProfileUser> _profiles = [];

  // wird am Anfang in Spashpage aufgerufen
  Future<List?> getProfileFromCollectionFromFirebase() async {
    User? currentProfile = FirebaseAuth.instance.currentUser;
    late String? uid = currentProfile?.uid;

    _instance = FirebaseFirestore.instance;

    CollectionReference profile = _instance!.collection('users');

    DocumentSnapshot snapshot = await profile.doc(uid).get();

    var data = snapshot.data() as Map;
    var profilesData = data[uid] as List<dynamic>;

    //iteriert durch Kategorien und befüllt Liste
    profilesData.forEach((catData) {
      ProfileUser profil = ProfileUser.fromJson(catData);

      // _profiles.add(profil);

      if (_profiles.length > 1) {
        _profiles.clear();
      }
      _profiles.add(profil);

      print(_profiles);
      print(uid);

      //_categories.clear();
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentProfile?.delete();
    _profiles.clear();
  }

  List<ProfileUser> getProfile() {
    return _profiles;
  }
}
