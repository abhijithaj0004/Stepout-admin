import 'package:flutter/material.dart';
import 'package:stepoutadminapp/pages/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    gotoLogIn(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('lib/images/stepoutwhite.png'),
      ),
    );
  }

  gotoLogIn(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>const Auth(),
    ));
  }
}
