
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meals_app/models/login_user_model.dart';

import '../firebase_options.dart';

class LoginService {

  LoginService() {

  }

  LoginUserModel _userModel = LoginUserModel(displayName: null, email: null, photoUrl: null);

  LoginUserModel get loggedInUserModel => _userModel;

  Future<bool> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return false;
      print('User does not exist');
    }
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(
        credential);
    if (userCreds != null) {
      //userinfo
      _userModel = LoginUserModel(
          displayName: userCreds.user?.displayName,
          email: userCreds.user?.email,
          photoUrl: userCreds.user?.photoURL);
    }
    return true;
  }

  void signOut() async {
    await GoogleSignIn().signOut();
  }
}