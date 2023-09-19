import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/constants/constantswdget/constants_button.dart';
import 'package:stepoutadminapp/functions/auth_fn.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const StepOutImg(
                  height: 150,
                ),
                kheight10,
                Text(
                  'Enter your Email and we will send you a Password reset link',
                  style: GoogleFonts.itim(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email required';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Email',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                KButton(
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        authFn.resetPassword(
                            emailController.text.trim(), context);
                      }
                    },
                    label: Center(
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(fontSize: 20),
                            color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
