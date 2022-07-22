import 'package:meals_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../models/FirebaseUser.dart';
import '../services/handler.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Handler();
    } else {
      return WelcomePage();
    }
  }
}
