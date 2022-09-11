import 'dart:ffi';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:exemple/pages/auth/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exemple/utils/delayed_animation.dart';
import 'package:exemple/main.dart';
import 'package:exemple/services/auth_services.dart';


import '../../widgets/button_widget.dart';
import '../core/home.dart';
import '../core/navdrawer.dart';
import 'logup.dart';


AuthServices _authServices = AuthServices();

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return ThemeSwitchingArea(
        child: Builder(
        builder: (context) => Scaffold(

      body: Stack(children:[

        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                          "Connect email address",
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      SizedBox(height: 22),
                     Text(
                          "It is recommended that you connect your email address to us to better protect your information.",
                          style: GoogleFonts.poppins(
                            color: Colors.pinkAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                    ],
                  ),
                ),
                SizedBox(height: 35),
                LoginForm(),

                SizedBox(height: 40),

              ],
            ),
          ),
        )
      ],


      ),
    ),
        ),
    );
  }

}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
  var _obscureText = true;

 // final emailController = TextEditingController();
//  final passwordController = TextEditingController();

 // @override
 // void dispose(){
   // _emailCtrl.dispose();
    //_passCtrl.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [

            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                  hintText: 'client@mail.com',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    CupertinoIcons.at,
                    color: Colors.blue,
                    size: 18,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              obscureText: true,
              controller: _passCtrl,
              decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.blue,
                    size: 18,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            const SizedBox(
              height: 24,
            ),

            SizedBox(height: 70),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: d_red,
                          padding: EdgeInsets.symmetric(
                            horizontal: 125,
                            vertical: 13,
                          ),
                        ),
                        child: Text(
                          'SIGN IN',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () async {
                          if (_emailCtrl.text.trim().isEmpty ||
                              _passCtrl.text.isEmpty) {
                            const snackbar = SnackBar(
                                content:
                                Text("Email/Password cannot be empty!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          } else {
                            dynamic creds = await _authServices.loginUser(
                                _emailCtrl.text, _passCtrl.text);
                            if (creds == null) {
                              const snackbar = SnackBar(
                                  content: Text("Email/Password invalid!"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => MyHomePage()));
                            }
                          }
                        })),
              ],
            ),
            forgetPassword(context)
          ],
        ),
      ),
    );
  }



  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:30,

      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.deepPurpleAccent),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }


}