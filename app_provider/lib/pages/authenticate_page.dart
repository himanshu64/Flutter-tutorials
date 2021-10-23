import 'package:app_provider/main.dart';
import 'package:app_provider/pages/auth/login_page.dart';
import 'package:app_provider/pages/home/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const MyHomePage(
        title: 'Home page',
      );
    }

    return LoginPage();
  }
}
