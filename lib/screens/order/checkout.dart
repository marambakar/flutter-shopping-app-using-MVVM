import 'dart:async';

import 'package:alayniah/app_locale.dart';
import 'package:alayniah/data/location_data.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/data/user_data.dart';
import 'package:alayniah/screens/account/location_screen.dart';
import 'package:alayniah/screens/account/login_screen.dart';
import 'package:alayniah/screens/account/paypal_screen.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alayniah/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  final int id;
  // final String startDate;
  // final String endDate;
  // final int backdate;
  //
  Checkout({this.id});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  bool serverError = false, connectedToNetwork = true, error = false;
//  String address_data;
  String myCode = "";
  double supTotal = 0;
  String latitude, longitude;
  MapType _currentMapType = MapType.normal;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  static LatLng _center;
  Set<Marker> _markers = {};
  LatLng _lastMapPosition;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < orderItems.length; i++) {
      supTotal += orderItems[i].subTotal;
    }
    setState(() {
      SharedPreferences.getInstance().then((prefs) {
        String code1 = (prefs.getString('myCode') ?? null);
        myCode = code1;
        // print(" code is :" + code1);
      });
//      print("*********************************** address :");
//      _getCurrentLocation();
      if (address_data == null) {
        _getCurrentLocation();
//              _getUserLocation();

      }
    });
    // initialize();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        latitude_data = position.latitude;
        longitude_data = position.longitude;
        _getAddressFromLatLng();
        _center = LatLng(latitude_data, longitude_data);
        _lastMapPosition = _center;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude_data, longitude_data);

      Placemark place = placemarks[0];

      setState(() {
        address_data = "${place.country}" +
            ',' +
            "${place.administrativeArea}" +
            ',' +
            "${place.street}";
        user_data.city = address_data;
      });
//    print("************************");
//    print(address.toString());
    } catch (e) {
      print(e);
    }
  }

  var myArrPro = [
    {
      "pro_id": 1,
      "pro_name": "cat1",
      "pro_image": "images/cat1.png",
      "pro_desc":
          "Dates can be eaten fresh or dried, much like raisins. People can also add them to a variety of sweet or savory dishes",
      "pro_price": 100.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
//    _getAddressFromLatLng();
    return Scaffold(
      appBar: MyAppBar(
          text: "checkout".tr(),
          method: () {
            Navigator.of(context).pop();
          }),

//        extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Number :".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      // bo
                      //     ?
                      Text(
                        "#100",
//                          billFinall.billID.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      )
                      // : Text(""),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "dateandtime".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      // bo
                      //     ?
                      Text(
                        "6/6/2021 12:30",
//                          (DateTime.parse(billFinall.billDate).year.toString() +
//                              "-" +
//                              DateTime.parse(billFinall.billDate).month.toString() +
//                              "-" +
//                              DateTime.parse(billFinall.billDate).day.toString() +
//                              " ,   " +
//                              DateTime.parse(billFinall.billDate).hour.toString() +
//                              ":" +
//                              DateTime.parse(billFinall.billDate).minute.toString()),
                        // formatDate(DateTime.parse(billFinall.billDate), [ M, '-', d,'  ,  ' ,HH,':',nn,' ',am]).toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      )
                      // : Text(""),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
//              nocust != true
//                  ?
//            Padding(
//              padding: const EdgeInsets.all(5.0),
//              child: Column(
//                children: [
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        "UserName :".tr(),
//                        style: TextStyle(
//                          fontSize: 16,
//                        ),
//                        maxLines: 1,
//                      ),
//                      Text(
//                        "customer.fName",
////                          prevcust == false
////                              ? billFinall.customer.fName
////                              : customer.fName,
//                        style: TextStyle(
//                          fontSize: 14,
//                        ),
//                        maxLines: 1,
//                      ),
//                    ],
//                  ),
////                    Row(
////                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                      children: [
////                        Text(
////                          "MobileNumber".tr(),
////                          style: TextStyle(
////                            fontSize: 16,
////                          ),
////                          maxLines: 1,
////                        ),
////                        Text(
////                          prevcust == false
////                              ? billFinall.customer.phoneNumber
////                              : customer.phoneNumber,
////                          style: TextStyle(
////                            fontSize: 14,
////                          ),
////                          maxLines: 1,
////                        ),
////                      ],
////                    ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        "StoryPoint :".tr(),
//                        style: TextStyle(
//                          fontSize: 16,
//                        ),
//                        maxLines: 1,
//                      ),
////                        Text(
////                          prevcust == false
////                              ? billFinall.customer.point.toString()
////                              : customer.point.toString(),
////                          style: TextStyle(
////                            fontSize: 14,
////                          ),
////                          maxLines: 1,
////                        ),
//                    ],
//                  ),
//                  Divider(
//                    thickness: 2,
//                  ),
//                ],
//              ),
//            )
////                  : Container(),
//
//            ,
//            Padding(
//                padding: const EdgeInsets.all(5.0),
//                child: Column(
//                  children: [
//                    Text(
//                      "yourproducts".tr(),
//                      style: TextStyle(
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold,
//                      ),
//                      maxLines: 1,
//                    ),
//                    SingleChildScrollView(
//                      child: ListView.builder(
//                          shrinkWrap: true,
//                          itemCount: 1, //billFinall.billProducts.length,
//                          itemBuilder: (context, index) {
//                            return Column(children: [
//                              Row(
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(5.0),
//                                    child: Text(
//                                      "quantity"
////                                        billFinall.billProducts[index].quantity
//                                          .toString(),
//                                      style: TextStyle(
//                                        fontSize: 16,
//                                      ),
//                                      maxLines: 1,
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      AppLocale().locale == Locale('ar')
//                                          ? "nameAr"
////                                        widget.bill.billProducts[index].product
////                                            .nameAr
//                                          : "nameAr",
////                              widget.bill.billProducts[index].product
////                                            .nameEn,
//                                      style: TextStyle(
//                                        fontSize: 16,
//                                        // fontWeight: FontWeight.bold,
//                                      ),
//                                      maxLines: 1,
//                                    ),
//                                  ),
//                                  Text(
//                                    "soldProductPrice",
////                                      billFinall.billProducts[index].soldProductPrice
////                                          .toString(),
//                                    style: TextStyle(
//                                      fontSize: 14,
//                                    ),
//                                    maxLines: 1,
//                                  ),
//                                ],
//                              ),
//                            ]);
//                          }),
//                    ),
//                  ],
//                )),
//            Divider(
//              thickness: 2,
//            ),
            // Padding(padding: EdgeInsets.all(10)),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location :".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250.0,
                          child: address_data != null
                              ? Text(
                                  address_data,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(fontSize: 14.0),
                                )
                              : Text(""),
                        ),
                        myCode!=null?  GestureDetector(
                          onTap: () {
                            return showDialogregestrationMap(context);
//                            Navigator.push(
//                                context,
//                                PageTransition(
//                                    type: PageTransitionType.fade,
//                                    child: LocationScreen()));
                          },
                          child: Text(
                            "change".tr(),
//                          billFinall.shipping.address,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color_splash3),
                            maxLines: 1,
                          ),
                        ):Container(),
                      ],
                    ),
                  ),

//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text(
//                        "Delivery Cost :".tr(),
//                        style: TextStyle(
//                          fontSize: 16,
//                        ),
//                        maxLines: 1,
//                      ),
//                      Text(
//                        "cost",
////                          billFinall.shipping.cost.toString(),
//                        style: TextStyle(
//                          fontSize: 14,
//                        ),
//                        maxLines: 1,
//                      ),
//                    ],
//                  ),
                ],
              ),
            ),
          Divider(
              thickness: 2,
            ),
//            Padding(
//                padding: const EdgeInsets.all(5.0),
//                child: Column(
//                  children: [
//                    Text(
//                      "paymentmethod".tr(),
//                      style: TextStyle(
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold,
//                      ),
//                      maxLines: 1,
//                    ),
//                    SingleChildScrollView(
//                        child: ListView.builder(
//                            shrinkWrap: true,
//                            itemCount: 1, //billFinall.payments.length,
//                            itemBuilder: (context, index) {
//                              return Column(
//                                children: [
//                                  Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    children: [
////                                        Text(
////                                          billFinall.payments[index].paymentType == 0
////                                              ? "Cash".tr()
////                                              : billFinall.payments[index]
////                                              .paymentType ==
////                                              1
////                                              ? "Creidit Card".tr()
////                                              : billFinall.payments[index]
////                                              .paymentType ==
////                                              2
////                                              ? "Visa Card".tr()
////                                              : "Bank Transformation".tr(),
////                                          style: TextStyle(
////                                            fontSize: 16,
////                                          ),
////                                          maxLines: 1,
////                                        ),
////                                      Text(
////                                        (billFinall.payments[index].amount /
////                                            coins[billFinall.payments[index]
////                                                .currencyID -
////                                                1]
////                                                .eachOneRiyalEqual)
////                                            .toString() +
////                                            "  " +
////                                            coins[billFinall.payments[index]
////                                                .currencyID -
////                                                1]
////                                                .name
////                                                .tr(),
////                                        style: TextStyle(
////                                          fontSize: 14,
////                                        ),
////                                        maxLines: 1,
////                                      ),
//                                    ],
//                                  ),
//                                ],
//                              );
//                            })),
//                  ],
//                )),
//            Divider(
//              thickness: 2,
//            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "subtotal".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        supTotal.toString(),
//                          widget.subTotal.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "discount".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "0.0",
//                          widget.discount.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "tax".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "0.0",
//                          widget.tax.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "deliverycost".tr(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "0.0",
//                          billFinall.shipping.cost.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            // Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total".tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    "0.0",
//                      (widget.total + s1.cost).toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ButtonWidget(
                text: "checkout".tr(),
                method: () {
                  if (myCode == null) {
                    return _showSheetMessage(context);
                  } else {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: PayPalScreen(
                              id: widget.id,
                            )));
                  }

//                    print("bills in checkout#############################"+bills.length.toString());

//                  for(int i=0;i<bills.length;i++){
//                    print("bills in checkout#############################");
//                    print(bills[i].billProducts[0].product.nameEn
//                        .toString());
//                  }
//                    print("widget.thisCustomer in checkout#############################");
//                    print(widget.thisCustomer);

//                    customers.removeAt(widget.thisCustomer); //.removeLast();//
//                    bills.removeAt(widget.thisCustomer); //.removeLast();//
//                    total.removeAt(widget.thisCustomer);
//                    subTotal.removeAt(widget.thisCustomer);
//                    discount.removeAt(widget.thisCustomer);
//                    tax.removeAt(widget.thisCustomer);

//                    print("bills in checkout#############################"+bills.length.toString());

//                  for(int i=0;i<bills.length;i++){
//                    print("bills in checkout#############################");
//                    print(bills[i].billProducts[0].product.nameEn
//                        .toString());
//                  }
//                    print("cutomers in checkout#############################"+bills.length.toString());

//                    for(int i=0;i<customers.length;i++){
//                      print("cutomers in checkout#############################");
//                      print(customers[i]
//                          .toString());
//                    }
//                    print("widget.thisCustomer in checkout#############################");
//                    print(widget.thisCustomer);

//                    print(
//                        "*****************home**************************** customers: " +
//                            customers.length.toString());
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => HomeScreen()),
//                    );
                  // FocusScope.of(context).unfocus();
                  // setState(() {
                  //
                  //   Center(
                  //     child: SizedBox(
                  //       child: CircularProgressIndicator(),
                  //       height: 24,
                  //       width: 24,
                  //     ),
                  //   );
                  // });
                },
              ),
            ),
          ],
        )),
      ),
//      Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//          Column(
//            children: [
//              CheckoutRowWidget(
//                text: "subtotal".tr(),
//                value: supTotal,
//              ),
//              CheckoutRowWidget(
//                text: "discount".tr(),
//                value: myArrPro[0]["pro_price"],
//              ),
//              CheckoutRowWidget(
//                text: "tax".tr(),
//                value: myArrPro[0]["pro_price"],
//              ),
//              CheckoutRowWidget(
//                text: "deliveryfee".tr(),
//                value: myArrPro[0]["pro_price"],
//              ),
//              Divider(color: Color_splash3),
//              CheckoutRowWidget(
//                text: "totalprice".tr(),
//                value: myArrPro[0]["pro_price"],
//                val: 1,
//              ),
//            ],
//          ),
//          ButtonWidget(
//            text: "checkout".tr(),
//            method: () {
//              FocusScope.of(context).unfocus();
//              setState(() {
//                Center(
//                  child: SizedBox(
//                    child: CircularProgressIndicator(),
//                    height: 24,
//                    width: 24,
//                  ),
//                );
//                error = false;
//              });
//              Navigator.push(
//                  context,
//                  PageTransition(
//                      type: PageTransitionType.fade,
//                      child:PayPalScreen(
//                        id: widget.id,
//                      )));
//
//
////           var res = await booking(
////               "api/booking/addToCart",
////               widget.id.toString(),
////               "car",
////               "1",
////               widget.startDate.toString(),
////               widget.endDate.toString());
////
////           print(widget.id.toString() +
////               "  " +
////               "1" +
////               "  " +
////               widget.startDate +
////               "  " +
////               widget.endDate);
////           print(res.statusCode);
////           print("booking_code");
////           print(booking_code);
////           booking_code = json.decode(res.body)['booking_code'];
////           if (res.statusCode == 200) {
////             print(json.decode(res.body));
////             if (json.decode(res.body)['status'] == 1) {
////               // Navigator.push(
////               //     context,
////               //     MaterialPageRoute(
////               //         builder: (context) => CheckoutScreen(booking_code)));
////             } else {
////               _showSheetMessage(context,widget.id,widget.backdate);
////             }
////
//// //            if (dropdownValue == "option1") {
//// //              Navigator.push(context,
//// //                  MaterialPageRoute(builder: (context) => PayPalScreen()));
//// //            } else if (dropdownValue == "option0") {
//// //              Navigator.push(
//// //                  context,
//// //                  MaterialPageRoute(
//// //                      builder: (context) => CongratulationsScreen()));
//// //            }
////           } else {
////             setState(() {
////               error = true;
////             });
////           }
//            },
//          )
//        ],
//      ),
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() async {
    setState(
      () {
        _markers.add(
          Marker(
            // This marker id can be anything that uniquely identifies each marker.
            markerId: MarkerId(_lastMapPosition.toString()),
            position: _lastMapPosition,
          ),
        );
        latitude_data = _lastMapPosition.latitude;
        longitude_data = _lastMapPosition.longitude;
        _getAddressFromLatLng();
      },
    );

    print("markerId^^^" + _lastMapPosition.toString());
  }

  showDialogregestrationMap(BuildContext context) async {
    LatLng temp = await LatLng(latitude_data, longitude_data);
    _center = await LatLng(latitude_data, longitude_data);
    setState(() {
      _markers.add(
        Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(_lastMapPosition.toString()),
          position: temp,
//        icon: await getMarkerIcon(img, Size(150.0, 150.0))
        ),
      );
      latitude_data = _lastMapPosition.latitude;
      longitude_data = _lastMapPosition.longitude;
    });
//    print("markerId^^^"+_lastMapPosition.toString());
    Completer<GoogleMapController> _controller;

    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),

      child: Stack(
        children: [
          GoogleMap(
            mapType: _currentMapType,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            compassEnabled: true,
            markers: _markers,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
          ),
          Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _onMapTypeButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(Icons.map, size: 36.0),
              )),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                return _onAddMarkerButtonPressed();
              },
              //   materialTapTargetSize: MaterialTapTargetSize.padded,
              //  backgroundColor: Colors.green,
              icon: const Icon(
                Icons.add_location,
                size: 55.0,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      insetPadding: EdgeInsets.symmetric(
          vertical: screenHeight / 50, horizontal: screenWidth / 50),
      //  clipBehavior: Clip.antiAliasWithSaveLayer,
    );

    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}

void _showSheetMessage(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView(
            children: <Widget>[
              AnimationLimiter(
                  child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Padding(padding: EdgeInsets.only(top: 60)),
                  Text(
                    "youshouldloginbeforeaddtocart",
                    style: TextStyle(
                        color: Color_splash3,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ).tr(),
                  ButtonWidget(
                    text: "login".tr(),
                    method: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  )
                ],
              ))),
            ],
          ),
        );
      });
}
