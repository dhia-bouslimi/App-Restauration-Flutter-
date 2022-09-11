import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:exemple/pages/core/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../../utils/delayed_animation.dart';

class contact extends StatelessWidget {
  static const String routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text("Contact"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
          backgroundColor: d_red,
        ),
        drawer: NavDrawer(),
        body: Stack(
          children: [
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
                          DelayedAnimation(
                            delay: 1500,
                            child: Text(
                              "Contact Us",
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 22),
                          DelayedAnimation(
                            delay: 1700,
                            child: Text(
                              "A problem,a question? do not hesitate to use this form to contact us!",
                              style: GoogleFonts.poppins(
                                color: Colors.pinkAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    LoginForm(),
                  ],
                ),
              ),
            )
          ],
        )

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

  String _email='';
  final List<String> genderItems = [
    'Utilisateur',
    'Restaurant',
  ];

  String? selectedValue;
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

            DelayedAnimation(
              delay: 1900,
              child:  TextFormField(
                validator: (val) => !val!.contains("@") ? "Email Id is not Valid" : null ,
                onSaved: (val) => _email = val!,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email"
                ),
              ),
            ),
            SizedBox(height: 20),
            DelayedAnimation(
              delay: 2100,
              child: DropdownButtonFormField2(
                decoration: InputDecoration(

                ),
                isExpanded: true,
                hint: const Text(
                  'What is the subject of your message',
                  style: TextStyle(fontSize: 16),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 3, right: 20),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                items: genderItems
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select role.';
                  }
                },
                onChanged: (value) {
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
            ),
            SizedBox(height: 20),
            DelayedAnimation(
                delay:2300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    hintText: 'Enter your message'
                  ),
                )
            ),

            SizedBox(height: 90),
            DelayedAnimation(
              delay: 2500,
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
                    'Send',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();


                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}