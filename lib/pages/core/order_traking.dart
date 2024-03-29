import 'dart:async';

import 'package:exemple/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async{
    Location location = Location();
    location.getLocation().then(
          (location) {

    currentLocation = location;
    },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
            (newLoc) {
              currentLocation = newLoc;
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  zoom: 13.5,
                  target: LatLng(newLoc.latitude!, newLoc.longitude!,))));
              setState((){});
            });
  }



  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude),
    );

    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) => polylineCoordinates.add(
        LatLng((point.latitude), point.longitude),
      ),
      );
      setState((){

      });
    }
  }


void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/Pin_source.png")
        .then((icon) {

    sourceIcon = icon;
    },
    );


    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/Pin_source.png")
        .then((icon) {

      destinationIcon = icon;
    },
    );


    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/Badge.png")
        .then((icon) {

      currentLocationIcon = icon;
    },
    );

}





  @override
  void initState(){
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
      ? const Center(child: Text("loading"))
      : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 13.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blueAccent,
            width: 6,
          ),
        },
        markers: {
           Marker(
            markerId: const MarkerId("currentLocation"),
            icon: currentLocationIcon,
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
         const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (mapController){
          _controller.complete(mapController);
        },
      ),
    );
  }
}
