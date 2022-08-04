import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:provider/provider.dart';

import '../helpers/appcolors.dart';
import '../models/loginuser.dart';
import '../services/auth.dart';
import '../services/profile_service.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final AuthService _auth = AuthService();

  bool _obscureText = true;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProfileService profilService =
        Provider.of<ProfileService>(context, listen: false);

    final nameField = TextFormField(
        controller: _name,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25.0),
            hintText: "Profilname",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com') ||
                value.endsWith('.de')) {
              return null;
            }
            return 'Geben Sie eine gültige E-Mail Adresse ein';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25.0),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Dieses Feld ist erforderlich.';
          }
          if (value.trim().length < 8) {
            return 'Das Passwort muss mindestens 8 Zeichen lang sein.';
          }
          // Return null if the entered password is valid
          return null;
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25.0),
            hintText: "Passwort",
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final txtbutton = TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: const Text('Zum Login gehen',
            ));

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(25.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic result = await _auth.registerEmailPassword(
                LoginUser(email: _email.text, password: _password.text));
            User? user = FirebaseAuth.instance.currentUser;

            await FirebaseFirestore.instance
                .collection("users")
                .doc(user?.uid)
                .set({
              user!.uid: [
                {
                  'email': _email.text,
                  'profilname': _name.text,
                  'created': DateTime.now().toString()
                }
              ]
            });

            profilService.getProfileFromCollectionFromFirebase();
            profilService.getProfile();

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
            if (result.uid == null) {
              //null means unsuccessfull authentication
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(result.code),
                    );
                  });
            }
          }
        },
        child: Text(
          "Registrieren",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Registrieren',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
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
                child: const Icon(FontAwesomeIcons.userNurse,
                    color: Colors.white, size: 100),
              )),
        ),

        Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  nameField,
                  const SizedBox(height: 25.0),
                  emailField,
                  const SizedBox(height: 25.0),
                  passwordField,
                //  const SizedBox(height: 25.0),
                  txtbutton,
                  const SizedBox(height: 25.0),
                  registerButton,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
