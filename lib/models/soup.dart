import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Soup{
  final String name;
  final int price;
  final String imageUrl;

  const  Soup({required this.name, required this.price, required this.imageUrl});

  static Soup fromSnapshot(DocumentSnapshot snap){
    Soup soup = Soup(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return soup;
  }




}