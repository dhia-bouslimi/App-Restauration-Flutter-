import 'package:exemple/controllers/cart_controller.dart';
import 'package:exemple/controllers/cart_soup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';


class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                  fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
            ),
         // SizedBox(height: 25),
            Spacer(),
            Text(
              '${controller.total}\DT',


              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
       Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: d_red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                ),
                child: Text(
                  'CHECKOUT',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                }
            ),
          ],

        ),




      ),
    );
  }
}
