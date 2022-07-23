import 'package:flutter/services.dart';

class ProfileUser {
  final String? email;
  // final String? password;
  final String? profilname;
  final String? uid;
  final String? created;

  @override
  String toString() {
    return '$email '
        '$profilname'
        '$created';
  }

  ProfileUser(
      {required this.email,
      required this.profilname,
      required this.uid,
      required this.created});

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
        email: json['email'],
        profilname: json['profilname'],
        uid: json['uid'],
        created: json['created']);
  }

  //method from subcategory class

}


  //to map a json structure