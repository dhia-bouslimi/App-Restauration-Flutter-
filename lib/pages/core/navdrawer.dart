
import 'package:exemple/pages/core/profile_page.dart';
import 'package:exemple/pages/core/restaurant.dart';
import 'package:exemple/pages/auth/social_page.dart';
import 'package:flutter/material.dart';
import 'package:exemple/main.dart';
import '../../utils/colors.dart';
import 'contact.dart';
import 'emplacement.dart';
import 'home.dart';
import 'my_drawer_header.dart';




class NavDrawer extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child:ListView(
        children: [
         //MyHeaderDrawer(),
          SizedBox(height: 40),
          ListTile(

            title: Text("Home"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: ()
            {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage()));
            },
          ),
          Divider(
            color: Colors.red,
          ),
          ListTile(
            title: Text("Emplacement"),
            leading: IconButton(
              icon: Icon(Icons.location_on_sharp),
              onPressed: () {
              },
            ),
            onTap: ()
            {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => emplacement()));
            },
          ),
          Divider(
            color: Colors.red,
          ),
          ListTile(
            title: Text("Restaurant"),
            leading: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
              },
            ),
            onTap: ()
            {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Restaurant_catalog()));
            },
          ),
          Divider(
            color: Colors.red,
          ),

          ListTile(
            title: Text("Contact"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: () {
              },
            ),
            onTap: ()
            {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => contact()));
            },
          ), Divider(
            color: Colors.red,
          ),
          SizedBox(height:300),
          ListTile(
            title: Text("Log Out"),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
              },
            ),
            onTap: ()
            {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SocialPage()));
            },
          ),
        ],
      ) ,
    )
    );
  }
}