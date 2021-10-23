import 'package:app_provider/pages/auth/login_page.dart';
import 'package:app_provider/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance
  AuthViewModel(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();
  final AuthService _authService = AuthService();

  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context,
      required String name}) async {
    try {
      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification().then((value) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
          showSnackBar(
              content: 'Email Verification send successfully',
              context: context);
        });
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginPage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(
            content: 'The password provided is too weak.', context: context);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
            content: 'The account already exists for that email.',
            context: context);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        //Navigation to home screen
      } else {
        //step 1 open modal and ask user to send verification link
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } on Exception catch (e) {}
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  showSnackBar({required String content, required BuildContext context}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
