import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/delayed_animation.dart';
import '../core/home.dart';
final Uri _url = Uri.parse('https://m.facebook.com/reg/?cid=103&refsrc=deprecated&soft=hjk');
class FacebookPage extends StatelessWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Image.asset("images/logo-facebook.jpg"),
          SizedBox(height: 5,),
          Text("Français ° العربية ° More..."),
          SizedBox(height: 15,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Phone or Email"
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "Password"
              ),

            ),
          ),
          SizedBox(height: 15,),
            Container(
              color: Colors.blueAccent,
              height: 30,
              width: 300,
              child: FlatButton(
                onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),
                ),
                ); },
                child: Text("Log In", style: TextStyle(color: Colors.white),) ,
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text("Forget Password ?", style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.w500 ),),
            ),
            SizedBox(height: 35,),
            Text("-----------------------------------OR--------------------------------------"),
            SizedBox(height: 24,),
            Container(
              color: Colors.green,
              height: 30,
              width: 300,
              child: FlatButton(
                onPressed: _launchUrl,
                child: Text("Create new facebook account", style: TextStyle(color: Colors.white),) ,
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 500,
                    child: Text(
                      "Ignorer",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent, fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      ),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

