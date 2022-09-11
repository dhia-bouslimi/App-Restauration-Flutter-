import 'package:exemple/controllers/cart_controller.dart';
import 'package:exemple/models/s_product.dart';
import 'package:exemple/models/soup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_soup.dart';

class CartSoup extends StatelessWidget {
  final Cart_soup_Controller controller = Get.put(Cart_soup_Controller());
  CartSoup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.soups.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return CartSoupCard(

                controller: controller,
                soup: controller.soups.keys.toList()[index],
                quantity: controller.soups.values.toList()[index],
                index: index,
              );
            }

        ),
      ),
    );
  }
}

class CartSoupCard extends StatelessWidget {
  final Cart_soup_Controller controller;
  final Soup soup;
  final int quantity;
  final int index;
  const CartSoupCard({
    Key? key,
    required this.controller,
    required this.soup,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(radius: 80,
            backgroundImage: NetworkImage(
              soup.imageUrl,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(child: Text(soup.name,style: TextStyle(fontSize: 16),),
          ),
          IconButton(
            onPressed: (){
              controller.removeSoup(soup);
            },
            icon: Icon(Icons.remove_circle),
          ),
          Text('${quantity}'),
          IconButton(
            onPressed: (){
              controller.addSoup(soup);
            },
            icon: Icon(Icons.add_circle),
          ),

        ],
      ),
    );
  }
}

