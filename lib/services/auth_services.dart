import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemple/models/s_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/end_user.dart';
import '../models/restaurant_models.dart';
import '../models/soup.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  EndUser _userFirebaseUser(User? firebaseUser) {
    return EndUser(uid: firebaseUser!.uid);
  }

  Future registerUser(EndUser newUser, String password) async {
    try {
      UserCredential endUserCredentials =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: newUser.email!, password: password);
      User firebaseUser = endUserCredentials.user!;
      addUserToCollection(newUser, firebaseUser.uid);
      return _userFirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user signup failed :: $err');
      log('user signup failed :: $stacktrace');
      return null;
    }
  }

  Future loginUser(String email, String password) async {
    try {
      UserCredential endUserCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = endUserCredentials.user!;
      return _userFirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user login failed :: $err');
      log('user login failed :: $stacktrace');
      return null;
    }
  }

  Future logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (err, stacktrace) {
      log('user login failed :: $err');
      log('user login failed :: $stacktrace');
      return null;
    }
  }

  Future addUserToCollection(EndUser newUser, String? uid) async {
    await _firebaseFirestore.collection('users').doc(uid).set(newUser.toJson());
  }


  Future<DocumentSnapshot> getUserData(String userID) async {
    return _firebaseFirestore.collection('users').doc(userID).get();
  }

  update (String uid,String about) async {
    try{
      _firebaseFirestore.collection('users').doc(_firebaseAuth.currentUser!.uid).update({'about': about});
    } catch(e){
      print(e);
    }
  }

  Stream<List<Product>> getAllProducts(){
    return _firebaseFirestore.collection('products').snapshots().map((snapshot){
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Soup>> getAllSoups(){
    return _firebaseFirestore.collection('soups').snapshots().map((snapshot){
      return snapshot.docs.map((doc) => Soup.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Restaurant>> getAllRestaurants(){
    return _firebaseFirestore.collection('restaurants').snapshots().map((snapshot){
      return snapshot.docs.map((doc) => Restaurant.fromSnapshot(doc)).toList();
    });
  }

}
