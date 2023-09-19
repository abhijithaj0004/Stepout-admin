import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
          title: Text(
            'Home',
            style: GoogleFonts.itim(
                textStyle: TextStyle(color: Colors.black, fontSize: 25)),
          )),
      body: Column(
        children: [
          Text(
            'data',
          ),
        ],
      ),
    );
  }
}
