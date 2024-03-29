import 'package:exemple/controllers/cart_controller.dart';
import 'package:exemple/models/s_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  final CartController controller = Get.find();
  CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
           itemCount: controller.products.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
           return CartProductCard(

           controller: controller,
            product: controller.products.keys.toList()[index],
             quantity: controller.products.values.toList()[index],
             index: index,
           );
        }

        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
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
            product.imageUrl,
          ),
          ),
          SizedBox(width: 20,),
          Expanded(child: Text(product.name,style: TextStyle(fontSize: 16),),
          ),
          IconButton(
            onPressed: (){
              controller.removeProduct(product);
            },
              icon: Icon(Icons.remove_circle),
          ),
          Text('${quantity}'),
          IconButton(
            onPressed: (){
              controller.addProduct(product);
            },
            icon: Icon(Icons.add_circle),
          ),

        ],
      ),
    );
  }
}

