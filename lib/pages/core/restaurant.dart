import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemple/controllers/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/restaurant_controller.dart';
import '../../main.dart';
import 'home.dart';


class Restaurant_catalog extends StatefulWidget {

  Restaurant_catalog({Key? key}) : super(key: key);

  @override
  State<Restaurant_catalog> createState() => _Restaurant_catalogState();
}

class _Restaurant_catalogState extends State<Restaurant_catalog> {
  final restaurantController = Get.put(RestaurantController());
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('ariana essoghra !',style: TextStyle(fontSize: 17),);
  bool closeTopContainer = false;
  double topContainer = 0;
  ScrollController controller = ScrollController();
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.10;
    //resizeToAvoidBottomPadding: false;
    return Obx(
          () => Flexible(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(


              title: customSearchBar,
              automaticallyImplyLeading: false,
              actions: [

                IconButton(
                  icon: Icon(Icons.location_on_sharp),
                  onPressed: () {
                    showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 500),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Column(

                              children: [
                                Align(
                                  heightFactor: 3,
                                  alignment: Alignment.center,
                                  child: Text("Adresse de livraison",style: TextStyle(fontSize: 18,color: Colors.black87.withOpacity(1.0),decoration: TextDecoration.none),),
                                ),
                                Divider(
                                  color: Colors.black38,
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 8),
                                    Icon( Icons.edit_location_alt_rounded,color: d_red,
                                    ),
                                    SizedBox(width: 25),
                                    Text(
                                      "Modifier l'adresse", style: GoogleFonts.poppins(
                                      color: Colors.black54.withOpacity(0.6),
                                      decoration: TextDecoration.none,
                                      fontSize: 14,

                                    ),),
                                    Spacer(),
                                    Material(
                                      child: IconButton(
                                        icon: Icon( Icons.arrow_forward_ios_rounded,color: d_red,size: 22,),
                                        onPressed: () {
                                        },
                                      ),
                                    )


                                  ],
                                ),

                                Divider(
                                  color: Colors.black38,
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 8),
                                    Icon( Icons.edit,color: d_red,
                                    ),
                                    SizedBox(width: 25),
                                    Text(
                                      "Choisissez une adresse existante", style: GoogleFonts.poppins(
                                      color: Colors.black38.withOpacity(0.6),
                                      decoration: TextDecoration.none,
                                      fontSize: 14,

                                    ),),
                                    Spacer(),
                                    Material(
                                      child: IconButton(
                                        icon: Icon( Icons.arrow_forward_ios_rounded,color: d_red,size: 22,),
                                        onPressed: () {
                                        },
                                      ),
                                    )


                                  ],
                                )
                              ],
                            ),

                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = const Icon(Icons.cancel);
                        customSearchBar = const ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                          title: TextField(
                            decoration: InputDecoration(
                              hintText: 'rechercher...',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {

                        customIcon = const Icon(Icons.search);
                        customSearchBar =InkWell(child: const Text('ariana essoghra',style: TextStyle(fontSize: 16),) ,
                          onTap: () {},
                        ) ;
                      }
                    });
                  },
                  icon: customIcon,
                )
              ],
              titleSpacing: 00.0,
              centerTitle: true,
              toolbarHeight: 60.2,
              toolbarOpacity: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              elevation: 25,
              backgroundColor: d_red,
            ),

            body: Container(
              height: size.height,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(height: 70),
                      Text(
                        "Loyality Cards",
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Tous les Vendeurs",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height:70,
                  ),

                  Expanded(
                      child: ListView.builder(
                          controller: controller,
                          itemCount: restaurantController.restaurants.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            double scale = 1.0;
                            if (topContainer > 0.5) {
                              scale = index + 0.5 - topContainer;
                              if (scale < 0) {
                                scale = 0;
                              } else if (scale > 1) {
                                scale = 1;
                              }
                            }
                            return CatalogRestaurant(index: index);
                          })),



                ],
              ),
            ),
          )),
    );
  }
}


class CatalogRestaurant extends StatelessWidget {


  //final cartController = Get.put(CartController());
  final RestaurantController restaurantController = Get.find();
  final int index;

  CatalogRestaurant({
    Key? Key,
    required this.index,

  }) : super(key: Key);


  @override
  Widget build(BuildContext context) {

          return Material(

            type: MaterialType.transparency,

            child: InkWell(
              onTap: () {

              },
              child: Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(color: Colors.white70, blurRadius: 5.0),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                restaurantController.restaurants[index]
                                    .imageUrl,


                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              child: Expanded(child: Text(
                                restaurantController.restaurants[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                              ),
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),

                            Container(
                              child: Expanded(child: Text(
                                restaurantController.restaurants[index].type,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )),
            ),
          );

  }
}