import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemple/pages/core/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../../models/end_user.dart';
import '../../services/auth_services.dart';
import '../../widgets/textfield_widget.dart';
import '../auth/login.dart';
import 'edit_profile_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
AuthServices _authServices = AuthServices();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class EditProfilePage extends StatefulWidget {
  final bool isEdit;


   EditProfilePage({Key? key, this.isEdit = false }) : super(key: key);

  @override
  _EditProfilePageState createState() =>   _EditProfilePageState();
}
String downloadUrl = '';
String finalUrl = '';


class   _EditProfilePageState extends State<EditProfilePage> {



  File? file;

  late TextEditingController aboutController;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    aboutController = new TextEditingController();
    super.initState();

  }

  late final bool isEdit;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  XFile myImg = XFile('');
  File? selectedFile;
  String selectedFileName = '';
  //PlatformFile platformFile = PlatformFile(name: "name", sign: 2048);
File? _image;









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
                        uid: snapshot.data!["uid"],
                        fullname: snapshot.data!["fullname"],
                        // avatar_url: snapshot.data!["avatar_url"],
                        email: snapshot.data!["email"],
                        about: snapshot.data!["about"] ,
                        avatar_url: snapshot.data!["avatar_url"] ?? "",
                        phone: snapshot.data!["phone"]);
                    //print(userInfo.fullname);
                    return Container(

                      width: double.infinity,
                      alignment: Alignment.center,

                      child: Column(


                        children: [
                          Padding(padding: EdgeInsets.only(top: 40.0)),

                          file == null
                         ? InkWell(
                              onTap: () {
                                chooseImage();

                              },
                              child: Stack(
                                children: [

                                  CircleAvatar(
                                    child: buildEditIcon(color),
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
                          )
                          : Image.file(file!),
                          const SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: fullnameController,
                              label: 'FullName',
                              text: '${userInfo.fullname}',
                            //  onChanged: (name) {},
                            ),),
                          const SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                           controller: emailController,
                              label: 'Email',
                              text: userInfo.email!,
                             // onChanged: (email) {},
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFieldWidget(
                              controller: aboutController,
                              label: 'About',
                              text: userInfo.about!,
                              maxLines: 5,
                           //   onChanged: (about) {},
                            ),),
                          const SizedBox(height: 24),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: d_red,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 170,
                                  vertical: 13,
                                ),
                              ),
                              child: Text(
                                'SAVE',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                 updateProfile(context);
                // _authServices.update("", aboutController.text);
                              })
                        ],
                      ),
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


    final image = NetworkImage(userInfo.avatar_url!);

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
        Icons.camera_alt_sharp,
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


  chooseImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("file " + xfile!.path);
    file = File(xfile!.path);
    setState(() {  myImg = XFile(xfile.path);});
  }





  updateProfile(BuildContext context) async {
    Map<String, dynamic> json = Map();

    if (file != null) {
      String url = await uploadImage();

      json['avatar_url'] = url;

    }



    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(json);
    Navigator.pop(context);
  }






  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
        "${FirebaseAuth.instance.currentUser?.uid!}_${basename(file!.path)}")
        .putFile(file!);

    return taskSnapshot.ref.getDownloadURL();
  }

}