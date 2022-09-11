import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Product{
  final String name;
  final int price;
  final String imageUrl;

const  Product({required this.name, required this.price, required this.imageUrl});

static Product fromSnapshot(DocumentSnapshot snap){
  Product product = Product(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
  );
  return product;
}

 // static const List<Product> products = [
  //Product(
    //  name: 'Mexicain',
    //price: 2.99,
    //imageUrl:'https://www.google.com/search?q=salad+image+png&tbm=isch&ved=2ahUKEwiwlMH1r8H5AhXI8IUKHTbZDfIQ2-cCegQIABAA&oq=salad+image+png&gs_lcp=CgNpbWcQAzIECAAQEzoGCAAQHhATOggIABAeEAUQEzoICAAQHhAIEBNQlgZYqytg6CxoBnAAeACAAc4BiAHvCJIBBTAuNi4xmAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=FFH2YrC6I8jhlwS2sreQDw&bih=656&biw=1519&hl=fr#imgrc=ZkWQ83oSLwCipM'

  //),
    //Product(
      //  name: 'Italien',
        //price: 3.99,
        //imageUrl:'https://www.google.com/search?q=salad+image+png&tbm=isch&ved=2ahUKEwiwlMH1r8H5AhXI8IUKHTbZDfIQ2-cCegQIABAA&oq=salad+image+png&gs_lcp=CgNpbWcQAzIECAAQEzoGCAAQHhATOggIABAeEAUQEzoICAAQHhAIEBNQlgZYqytg6CxoBnAAeACAAc4BiAHvCJIBBTAuNi4xmAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=FFH2YrC6I8jhlwS2sreQDw&bih=656&biw=1519&hl=fr#imgrc=ZkWQ83oSLwCipM'

    //),
    //Product(
      //  name: 'Healthy',
        //price: 4.99,
        //imageUrl:'https://www.google.com/search?q=salad+image+png&tbm=isch&ved=2ahUKEwiwlMH1r8H5AhXI8IUKHTbZDfIQ2-cCegQIABAA&oq=salad+image+png&gs_lcp=CgNpbWcQAzIECAAQEzoGCAAQHhATOggIABAeEAUQEzoICAAQHhAIEBNQlgZYqytg6CxoBnAAeACAAc4BiAHvCJIBBTAuNi4xmAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=FFH2YrC6I8jhlwS2sreQDw&bih=656&biw=1519&hl=fr#imgrc=ZkWQ83oSLwCipM'

    //)

//];


}