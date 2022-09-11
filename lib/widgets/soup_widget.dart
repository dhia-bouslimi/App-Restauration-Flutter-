import 'package:exemple/controllers/cart_controller.dart';
import 'package:exemple/controllers/cart_soup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/product_controller.dart';
import '../controllers/soup_controller.dart';
import '../utils/constants.dart';
import 'catalog_products.dart';

class SoupProducts extends StatelessWidget {
  final soupController = Get.put(SoupController());
  SoupProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Flexible(
          child: ListView.builder(
              itemCount: soupController.soups.length,
              itemBuilder: (BuildContext context, int index) {
                return CatalogSoupCard(index: index);
              })),
    );
  }


}


class CatalogSoupCard extends StatelessWidget {

  final cart_soup_Controller = Get.put(Cart_soup_Controller());
  final SoupController soupController = Get.find();
  final int index;
  CatalogSoupCard({
    Key? Key,
    required this.index,
  }): super(key: Key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 30.0),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      soupController.soups[index].imageUrl,


                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: Text(soupController.soups[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: Text( '${soupController.soups[index].price} DT')),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: (){
                      cart_soup_Controller.addSoup(soupController.soups[index]);
                    },
                    icon: Icon(
                      Icons.add_circle,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ));

  }

}
