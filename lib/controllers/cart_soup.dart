import 'package:exemple/models/soup.dart';
import 'package:get/get.dart';

class Cart_soup_Controller extends GetxController{
  // Add product
  var _soups = {}.obs;

  void addSoup(Soup soup){
    if(_soups.containsKey(soup)){
      _soups[soup] +=1;
    } else {
      _soups[soup] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${soup.name} to the cart ",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeSoup(Soup soup){
    if(_soups.containsKey(soup) && _soups[soup] == 1){
      _soups.removeWhere((key, value) => key == soup);
    }
    else{
      _soups[soup] -=1;
    }
  }


  get soups => _soups;

  get soupSubtotal => _soups.entries.map((soup) => soup.key.price * soup.value).toList();


  get total => _soups.entries.map((soup) => soup.key.price * soup.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
}