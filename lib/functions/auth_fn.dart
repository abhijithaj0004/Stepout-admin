import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFn {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOutWithGoogle() async {
    // Sign out with firebase
    await firebaseAuth.signOut();
    // Sign out with google
    await googleSignIn.signOut();
  }

  Future<void> signIn(context, email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.code,
          style: GoogleFonts.itim(textStyle:const TextStyle(fontSize: 20)),
        ),
        duration:const Duration(milliseconds: 1000),
      ));
    }
  }

  resetPassword(email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Password Reset request send',
          style: GoogleFonts.itim(textStyle:const TextStyle(fontSize: 20)),
        ),
        duration:const Duration(milliseconds: 1000),
      ));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.code,
          style: GoogleFonts.itim(textStyle:const TextStyle(fontSize: 20)),
        ),
        duration:const Duration(milliseconds: 1000),
      ));
    }
  }
}
