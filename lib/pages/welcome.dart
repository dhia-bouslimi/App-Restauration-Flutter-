import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exemple/utils/delayed_animation.dart';
import 'package:exemple/main.dart';
import 'package:exemple/pages/auth/login.dart';

import 'package:exemple/pages/auth/social_page.dart';

import '../widgets/appbar_widget.dart';
import 'auth/in_up.dart';




class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
child: Builder(

        builder: (context) => Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 300,
            horizontal: 50,
          ),
    child: Column(
      children: [
        DelayedAnimation(
          delay: 2700,
          child: Container(

            height:300,
            child: Image.asset('images/Fauget.png'),
          ),
        ),

        DelayedAnimation(
          delay: 3700,
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: d_red,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(13)),
              child: Text('Get Started'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InUpPage(),
                ),
                );
              },
            ),
          ),
        ),
      ],
    ),
        ),
      ),
      ),
),
    );



  }
}
