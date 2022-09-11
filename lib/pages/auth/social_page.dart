import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:exemple/pages/core/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exemple/utils/delayed_animation.dart';
import 'package:exemple/main.dart';
import 'package:exemple/pages/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;
import 'package:firebase_auth/firebase_auth.dart';

import 'login_facebook.dart';


class SocialPage extends StatefulWidget {


  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  //GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
@override
  Widget build(BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }  // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
  //GoogleSignInAccount? user = _googleSignIn.currentUser;
    return ThemeSwitchingArea(
        child: Builder(
        builder: (context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
            child: Column(
              children: [


                DelayedAnimation(
                  delay: 1000,
                  child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Welcome to LivRoi",
                            style: GoogleFonts.poppins(
                              color: d_red,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "All your restaurants, delivered to your home.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],

                      )
                  ),
                ),
                DelayedAnimation(
                  delay: 1900,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 40,
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),
                          ),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: d_red,
                            padding: EdgeInsets.all(13),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon( Icons.mail_outlined,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'EMAIL', style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacebookPage(),
                          ),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Color(0xFF576dff),
                            padding: EdgeInsets.all(13),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.facebook),
                              SizedBox(width: 10),
                              Text(
                                'FACEBOOK', style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        ElevatedButton(onPressed: () async {
                        // await _googleSignIn.signIn();
                         //setState(() {});
                          signup(context);
                        },
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.white,
                            padding: EdgeInsets.all(13),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/goo.png',
                                height: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'GOOGLE', style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    ),
        ),
        );


  }
}