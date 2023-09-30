import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/pages/settings_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile',
          style: GoogleFonts.itim(
              textStyle: const TextStyle(fontSize: 25, color: Colors.black)),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const StepOutImg()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      FirebaseAuth.instance.currentUser?.photoURL ??
                          'https://i.stack.imgur.com/l60Hf.png',
                      fit: BoxFit.cover,
                    )),
              ),
              kheight20,
              Text(
                FirebaseAuth.instance.currentUser?.displayName ?? 'admin',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              kheight10,
              Text(
                FirebaseAuth.instance.currentUser?.email ?? 'admin@gmail.com',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              kheight30,
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 181, 181, 181)),
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  'EDIT PROFILE',
                  style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              kheight30,
              Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Settings(),
                  ));
                },
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
