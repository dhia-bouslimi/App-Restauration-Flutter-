import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/cart_products.dart';
import '../../widgets/cart_soup.dart';
import '../../widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: d_red,

      ),
      body: Column(
        children: [
          CartProduct(),
          CartTotal(),

        ],
      ),
    );
  }
}
