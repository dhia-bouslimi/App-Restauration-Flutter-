import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../../widgets/catalog_products.dart';
import '../../widgets/soup_widget.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Catalog"),
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

      ),      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),

          //  ElevatedButton(
            //  onPressed: () => Get.to(()=> CartScreen()),
              //child: Text('Go to Cart'), ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: d_red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 6,
                  ),
                ),
                child: Text(
                  'GO TO CART',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              onPressed: () => Get.to(()=> CartScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
