import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemple/pages/core/home.dart';
import 'package:exemple/models/end_user.dart';

import 'package:exemple/services/auth_services.dart';
import 'package:exemple/utils/app_strings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../../models/end_user.dart';
import '../../services/auth_services.dart';
import '../../utils/app_styles.dart';
import '../../utils/dims.dart';

TextEditingController _emailCtrl = TextEditingController();
TextEditingController _fullnameCtrl = TextEditingController();
TextEditingController _phoneCtrl = TextEditingController();
TextEditingController _passCtrl = TextEditingController();
TextEditingController _confirmPassCtrl = TextEditingController();
TextEditingController _aboutCtrl = TextEditingController();

bool _isPassMatch = false;

AuthServices _authServices = AuthServices();

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
            margin: AppDims.globalMargin,
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.registerPageSignIN,
                      style: AppStyles.authTitleStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
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
                  controller: _fullnameCtrl,
                  decoration: InputDecoration(
                      hintText: 'Full name',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(
                        CupertinoIcons.person,
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
                  controller: _phoneCtrl,
                  decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(
                        CupertinoIcons.phone,
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
                  controller: _aboutCtrl,
                  decoration: InputDecoration(
                      hintText: 'About',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(
                        CupertinoIcons.textformat_abc,
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
                TextField(
                  obscureText: true,
                  controller: _confirmPassCtrl,
                  onChanged: (val) {
                    setState(() {
                      _passCtrl.text == val
                          ? _isPassMatch = true
                          : _isPassMatch = false;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'confirm password',
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
                  height: 16,
                ),
                Visibility(
                    visible: _isPassMatch,
                    replacement: Row(
                      children: const [
                        Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.redAccent,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'passwords do not match.',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          color: Colors.teal,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'passwords match.',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 24,
                ),
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
                              'SIGN UP',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () async {
                              EndUser newUser = EndUser(
                                  uid: 'uid',
                                  fullname: _fullnameCtrl.text.trim(),
                                  phone: _phoneCtrl.text.trim(),
                                  email: _emailCtrl.text.trim(),
                                  about: _aboutCtrl.text.trim(),
                               );

                              if (_fullnameCtrl.text.trim().isNotEmpty &&
                                  _emailCtrl.text.trim().isNotEmpty &&
                                  _phoneCtrl.text.trim().isNotEmpty &&
                                  _passCtrl.text.trim().isNotEmpty &&
                                  _aboutCtrl.text.trim().isNotEmpty &&
                                  _passCtrl.text == _confirmPassCtrl.text) {
                                dynamic creds = await _authServices.registerUser(
                                    newUser, _passCtrl.text.trim());
                                if (creds == null) {
                                  const snackbar = SnackBar(
                                      content: Text("Email/Password invalid!"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>  MyHomePage()));
                                }
                              }
                            })),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
