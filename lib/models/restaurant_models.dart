import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Restaurant{
  final String name;
  final String type;
  final String imageUrl;
  const  Restaurant({required this.name, required this.type, required this.imageUrl});

  static Restaurant fromSnapshot(DocumentSnapshot snap){
    Restaurant restaurant = Restaurant(
      name: snap['name'],
      type: snap['type'],
      imageUrl: snap['imageUrl'],
    );
    return restaurant;
  }



}