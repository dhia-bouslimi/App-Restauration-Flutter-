import 'package:exemple/services/auth_services.dart';
import 'package:get/get.dart';

import '../models/restaurant_models.dart';

class RestaurantController extends GetxController{

  final restaurants = <Restaurant>[].obs;

  @override
  void onInit(){
    restaurants.bindStream(AuthServices().getAllRestaurants());
    super.onInit();
  }
}