import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/end_user.dart';
import '../../services/auth_services.dart';
import '../auth/login.dart';
import 'edit_profile_page.dart';

AuthServices _authServices = AuthServices();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  final bool isEdit;


  const ProfileScreen({Key? key, this.isEdit = false }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  late final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot<Object?>>(
                future: _authServices.getUserData(_firebaseAuth.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print('response: ${snapshot.data!["fullname"]}');

                    EndUser userInfo = EndUser(
                        uid: '',
                        fullname: snapshot.data!["fullname"],
                        avatar_url: snapshot.data!["avatar_url"] ?? '',
                        email: snapshot.data!["email"],
                        about: snapshot.data!["about"],
                        phone: snapshot.data!["phone"]);
                    //print(userInfo.fullname);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                splashRadius: 18,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(CupertinoIcons.chevron_back)),
                            const Text(
                              'Homepage',
                              style: TextStyle(color: Colors.black87, fontSize: 13),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () async {
                                  await _authServices.logout().then((value) =>
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                               LoginPage())));
                                },
                                child: const Text('logout')),
                            const SizedBox(
                              width: 26,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),

                                 InkWell(
                                   onTap: (){
                                     Navigator.of(context).push(
                                       MaterialPageRoute(builder: (context) => EditProfilePage()),
                                     );
                                   },
                                   child:Stack(
                  children: [
                  CircleAvatar(
                  radius: 64,
                  foregroundImage: NetworkImage(userInfo.avatar_url!),
                  ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: buildEditIcon(color),
                    ),
                  ],
                                   )
                                 ),

                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${userInfo.fullname}',
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  userInfo.email!,
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 48),
                          child: Column(
                            children: [

                                Text(
                                  'About',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                              Column(
                                children: [
                                  Text(
                                    userInfo.about!,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )


                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
          )),
    );
  }
  Widget buildImage() {
    EndUser userInfo = EndUser(uid: '');


    final image = NetworkImage(finalUrl);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,

        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
     Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  //Widget buildAbout() => Container(
    //padding: EdgeInsets.symmetric(horizontal: 48),
   // child: Column(
     // crossAxisAlignment: CrossAxisAlignment.start,
      //children: [
        //Text(
        //  'About',
          //style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //  ),
        //const SizedBox(height: 16),
        //Text('',
          //style: TextStyle(fontSize: 16, height: 1.4),
     //   ),
      //],
    //),
  //);

}