import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

const FOOD_DATA = [
  {
    "name":"Burger",
    "brand":"Hawkers",
    "price":2.99,
    "image":"burger.png"
  },{
    "name":"Cheese Dip",
    "brand":"Hawkers",
    "price":4.99,
    "image":"cheese_dip.png"
  },
  {
    "name":"Cola",
    "brand":"Mcdonald",
    "price":1.49,
    "image":"cola.png"
  },
  {
    "name":"Fries",
    "brand":"Mcdonald",
    "price":2.99,
    "image":"fries.png"
  },
  {
    "name":"Ice Cream",
    "brand":"Ben & Jerry's",
    "price":9.49,
    "image":"ice_cream.png"
  },
  {
    "name":"Noodles",
    "brand":"Hawkers",
    "price":4.49,
    "image":"noodles.png"
  },
  {
    "name":"Pizza",
    "brand":"Dominos",
    "price":17.99,
    "image":"pizza.png"
  },
  {
    "name":"Sandwich",
    "brand":"Hawkers",
    "price":2.99,
    "image":"sandwich.png"
  },
  {
    "name":"Wrap",
    "brand":"Subway",
    "price":6.99,
    "image":"wrap.png"
  }
];

const String google_api_key = "API_KEY";




final w = Get.width;
final h = Get.height;

const Color unSelectedColor = Color.fromARGB(255, 234, 234, 234);