import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:exemple/pages/auth/social_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/delayed_animation.dart';
import 'logup.dart';
import '../../main.dart';

class InUpPage extends StatelessWidget {
  const InUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
        builder: (context) => Scaffold(
      backgroundColor: Color(0xFFf38375),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 300,
            horizontal: 50,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1400,
                child: Container(
                    width: double.infinity,
                    child: OutlinedButton( onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SocialPage(),
                      ),
                      );
                    },
                      child: Text('Sign In',
                        style:TextStyle(fontSize: 25, color: Colors.white70,fontStyle: FontStyle.italic  ),
                      ),
                      style: OutlinedButton.styleFrom( shape: CircleBorder(),
                        padding: EdgeInsets.all(45),
                      ),
                    )
                ),
              ),
              SizedBox(height: 40),
              DelayedAnimation(
                delay: 1900,
                child: Container(
                  width: double.infinity,
                  child: OutlinedButton( onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),
                    ),
                    );
                  },
                child: Text('Sign Up',
                  style:TextStyle(fontSize: 25, color: Colors.white70,fontStyle: FontStyle.italic  ),
                ),
                style: OutlinedButton.styleFrom( shape: CircleBorder(),
                  padding: EdgeInsets.all(45),
                ),
              )
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
