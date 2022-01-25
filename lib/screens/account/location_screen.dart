//import 'package:alayniah/data/location_data.dart';
//import 'package:alayniah/screens/account/profile_info.dart';
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class LocationScreen extends StatefulWidget {
//  @override
//  _LocationScreenState createState() => _LocationScreenState();
//}
//
//////          "current_key": "AIzaSyCmqekrDC73TERwREfiGw5oZb7_Qx4c6QY"
//class _LocationScreenState extends State<LocationScreen> {
//  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
//  GoogleMapController _controller;
//  Location _location = Location();
//
//  void _onMapCreated(GoogleMapController _cntlr) {
//    _controller = _cntlr;
////    _location.onLocationChanged.listen((l) {
////      setState(()  {
////        myMarker.add(
////            Marker(
////                markerId: MarkerId(l.toString()),
////                position: LatLng(l.latitude, l.longitude)
////            )
////        );
////
////      });
////    });
//    onLocationChanged(_location) {
//      _controller.animateCamera(
//        CameraUpdate.newCameraPosition(
//          CameraPosition(
//              target: LatLng(_location.latitude, _location.longitude)),
//        ),
//      );
//    }
//
//    ;
//  }
//
//  List<Marker> myMarker = [];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.transparent,
//        elevation: 0,
//      ),
//      extendBodyBehindAppBar: true,
//      body: Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        child: Stack(
//          children: [
//            GoogleMap(
//              initialCameraPosition:
//                  CameraPosition(target: _initialcameraposition),
//              mapType: MapType.normal,
//              onMapCreated: _onMapCreated,
//              myLocationEnabled: true,
//              markers: Set.from(myMarker),
//              onTap: _handleTap,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  _handleTap(LatLng tappedPoint) async {
//    print(tappedPoint.toString());
//    setState(() {
//      myMarker = [];
//      myMarker.add(Marker(
//          markerId: MarkerId(tappedPoint.toString()),
//          position: LatLng(tappedPoint.latitude, tappedPoint.longitude)));
//    });
//    setState(() {
//      latitude_data = tappedPoint.latitude;
//      longitude_data = tappedPoint.longitude;
//      print("****in mark :" + tappedPoint.toString());
//    });
//  }
//}
