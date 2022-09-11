import 'package:flutter/material.dart';
import 'package:exemple/pages/core/navdrawer.dart';

import '../../main.dart';

class emplacement extends StatelessWidget {
  static const String routeName = '/emplacement';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text("Emplacement"),
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
        drawer: NavDrawer(),
        body: Center(child: Text("This is emplacement page")));
  }
}