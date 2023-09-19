import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/constants/constantswdget/constants_button.dart';
import 'package:stepoutadminapp/functions/auth_fn.dart';
import 'package:stepoutadminapp/pages/loginpage/forgot_password.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthFn authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StepOutImg(
                height: 170,
              ),
              kheight20,
              Text(
                'Welcome to Admin App',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                  fontSize: 32,
                  color: Color.fromARGB(255, 104, 103, 103),
                )),
              ),
              kheight10,
              Text(
                'Sign In and Continue',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 54, 54, 54))),
              ),
              kheight20,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Required';
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 140, 140, 140))),
                ),
              ),
              kheight30,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password Required';
                  }
                  return null;
                },
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 140, 140, 140))),
                ),
              ),
              kheight30,
              KButton(
                  onClick: () {
                    authFn.signIn(context, emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  label: Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.itim(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )),
              kheight10,
              Text(
                'OR',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 54, 54, 54))),
              ),
              kheight10,
              KButton(
                  onClick: () {
                    authFn.signInWithGoogle();
                  },
                  label: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/googlenew.png',
                          height: 50,
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Text(
                          'Continue with Google',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  )),
              kheight20,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ));
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 129, 129, 129))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
