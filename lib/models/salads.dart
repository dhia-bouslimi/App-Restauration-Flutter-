import 'package:flutter/material.dart';
import 'package:exemple/pages/core/navdrawer.dart';

import '../../main.dart';

class salads extends StatelessWidget {
  static const String routeName = '/salads';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading:IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Salads"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          actions:<Widget> [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),

          ],

          elevation: 0.00,
          backgroundColor: d_red,
        ),
        body: OrientationBuilder(
        builder: (context, orientation){
          return orientation == Orientation.portrait
              ? _buildVerticalLayout() : _builHorizontalLayout() ;

        },
        )

    );
  }
}
Widget _builHorizontalLayout(){
  return Center(

  );
}

 Widget _buildVerticalLayout() {
  return Center(
    child: ListView(
      children: <Widget>[
       Padding(padding: const EdgeInsets.all(8.0),
       child: SizedBox(
         height:100,
         width: 200,
       ),
       ),
        Padding(padding:const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                spreadRadius: 1,
                blurRadius: 8,
                color: d_red,
              )
            ]
          ),
          child: const ListTile(
            title: Text(
              "demo dhia",
              style: TextStyle(fontSize: 22.0),

            ),
            trailing: Icon(Icons.favorite),
            subtitle: Text("lutter app"),
          ),
        ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        ),
        Padding(padding:const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    color: d_red,
                  )
                ]
            ),
            child: const ListTile(
              title: Text(
                "demo dhia",
                style: TextStyle(fontSize: 22.0),

              ),
              trailing: Icon(Icons.favorite),
              subtitle: Text("lutter app"),
            ),
          ),
        )
      ],
    ),
  );
}