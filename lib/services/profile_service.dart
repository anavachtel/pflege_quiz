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

    DocumentSnapshot snapshot = await profile.doc(uid).get();

    // 11wnGb4Mg9SZs7nhVKUnxbWtBht1

    var data = snapshot.data() as Map;
    var profilesData = data[uid] as List<dynamic>;

    //iteriert durch Kategorien und befüllt Liste
    profilesData.forEach((catData) {
      ProfileUser profil = ProfileUser.fromJson(catData);

      _profiles.add(profil);

      print(_profiles);

      //_categories.clear();
    });
  }
}
