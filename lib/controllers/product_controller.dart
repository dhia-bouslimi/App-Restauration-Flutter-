
import 'package:exemple/services/auth_services.dart';
import 'package:get/get.dart';

import '../models/s_product.dart';

class ProductController extends GetxController{

  final products = <Product>[].obs;

  @override
  void onInit(){
    products.bindStream(AuthServices().getAllProducts());
    super.onInit();
  }
}