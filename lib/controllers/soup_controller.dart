
import 'package:exemple/services/auth_services.dart';
import 'package:get/get.dart';

import '../models/s_product.dart';
import '../models/soup.dart';

class SoupController extends GetxController{

  final soups = <Soup>[].obs;

  @override
  void onInit(){
    soups.bindStream(AuthServices().getAllSoups());
    super.onInit();
  }
}