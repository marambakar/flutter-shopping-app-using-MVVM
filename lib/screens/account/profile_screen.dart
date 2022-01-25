import 'dart:async';

import 'package:alayniah/app_locale.dart';
import 'package:alayniah/data/location_data.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/data/user_data.dart';
import 'package:alayniah/screens/account/location_screen.dart';
import 'package:alayniah/screens/account/profile_info.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/screens/order/tracking_screen.dart';
import 'package:alayniah/screens/product/product_screen.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:alayniah/widget/profile_list_tile_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

enum Languages { Arabic, English }

class _ProfileScreenState extends State<ProfileScreen> {
  String myCode = "";
  Languages selectedLanguage;
  String latitude, longitude;
  MapType _currentMapType = MapType.normal;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  static LatLng _center;
  Set<Marker> _markers = {};
  LatLng _lastMapPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (AppLocale().locale == Locale('ar'))
      selectedLanguage = Languages.Arabic;
    else
      selectedLanguage = Languages.English;
    setState(() {
      SharedPreferences.getInstance().then((prefs) {
        String code1 = (prefs.getString('myCode') ?? null);
        myCode = code1;
        // print(" code is :" + code1);
      });
      if (address_data == null) {
        _getCurrentLocation();
//              _getUserLocation();

      }
    });

  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
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
              //          myCode != null ?
              ProfileListTileWidget(
                text: 'profileinformation'.tr(),
                color: Colors.black,
                icon: FontAwesomeIcons.infoCircle,
                iconColor: Color_splash3,
                method: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: ProfileInfoScreen(fromlogin: false,)));
                },
              ),
//              : Container(),

              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'favorite'.tr(),
                color: Colors.black,
                icon: Icons.favorite,
                iconColor: Color_splash3,
                method: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: ProductsScreen(
                            isfav: true,
                          )));
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => ProductsScreen(
//                            isfav: true,
//                          )));
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'trackingyourorder'.tr(),
                color: Colors.black,
                icon: Icons.track_changes,
                iconColor: Color_splash3,
                method: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: orderItems.length != 0
                              ? TrackingScreen(id: orderItems[0].order.id)
                              : Scaffold(
                                  appBar: MyAppBar(
                                    text: "trackingyourorder".tr(),
                                    method: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  body: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.do_not_disturb_alt,
                                          color: Colors.black26,
                                          size: 125,
                                        ),
                                        Text(
                                          "noorder".tr(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black26),
                                        ),
                                      ],
                                    ),
                                  ))));
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'languagesettings'.tr(),
                color: Colors.black,
                icon: FontAwesomeIcons.language,
                iconColor: Color_splash3,
                method: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    btnOkColor: Color_splash3,
                    dialogType: DialogType.NO_HEADER,
                    padding: EdgeInsets.all(10),
                    body: StatefulBuilder(
                      builder: (context, setState) {
                        return Column(
                          children: [
                            RadioListTile<Languages>(
                              title: const Text('العربية'),
                              value: Languages.Arabic,
                              groupValue: selectedLanguage,
                              onChanged: (Languages value) {
                                setState(() {
                                  selectedLanguage = value;
                                });
                              },
                            ),
                            RadioListTile<Languages>(
                              title: const Text('English'),
                              value: Languages.English,
                              groupValue: selectedLanguage,
                              onChanged: (Languages value) {
                                setState(() {
                                  selectedLanguage = value;
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    btnOkOnPress: () {
                      if (selectedLanguage == Languages.Arabic) {
                        if (context.locale != Locale('ar'))
                          setState(() {
                            context.locale = Locale('ar');
                          });
                      } else {
                        if (context.locale != Locale('en'))
                          setState(() {
                            context.locale = Locale('en');
                          });
                      }
                    },
                  )..show();
                },
              ),
              //
              Divider(
                color: Colors.grey,
                height: 1,
              ),
//                GestureDetector(
//                    child: Container(
//                      margin: EdgeInsets.symmetric(
//                          horizontal: size.height * 0.05,
//                          vertical: size.height * 0.01),
//                      padding: EdgeInsets.symmetric(
//                          horizontal: size.height * 0.02,
//                          vertical: size.height * 0.03),
//                      decoration: BoxDecoration(
//                        color: Color_splash3.withOpacity(0.3),
//                        borderRadius: BorderRadius.circular(50),
//                      ),
//                      child: Row(
//                        children: [
//                          Icon(
//                            Icons.location_on,
//                            color: Color_splash3,
//                          ),
//                          address != null
//                              ? Padding(
//                                  padding: const EdgeInsets.symmetric(
//                                      horizontal: 5.0),
//                                  child: Text(address),
//                                )
//                              : Padding(
//                                  padding: const EdgeInsets.symmetric(
//                                      horizontal: 5.0),
//                                  child: Text("your location").tr(),
//                                )
//                        ],
//                      ),
//                    ),
//                    onTap: () {
////                _getAddressFromLatLng(double.parse(latitude) ,double.parse(longitude) );
//
//                      Navigator.push(
//                          context,
//                          PageTransition(
//                              type: PageTransitionType.fade,
//                              child: LocationScreen()));
//                    }),

              ProfileListTileWidget(
                text: 'changeyourlocation'.tr(),
                color: Colors.black,
                icon: Icons.location_on,
                iconColor: Color_splash3,
                method: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    btnOkText: "map".tr(),
                    btnCancelText: "text".tr(),
                    btnOkColor: Color_splash3,
                    dialogType: DialogType.NO_HEADER,
                    btnCancelColor: Colors.orange,
                    padding: EdgeInsets.all(20),
                    body: StatefulBuilder(
                      builder: (context, setState) {
                        return Text(
                          "locationmethod",
                          style: TextStyle(fontSize: 16),
                        ).tr();
                      },
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    btnOkOnPress: () {
                      return showDialogregestrationMap(context);
//                      Navigator.push(
//                          context,
//                          PageTransition(
//                              type: PageTransitionType.fade,
//                              child: LocationScreen()));
                    },
                    btnCancelOnPress: () {
                      setState(() {
                        print("cancel");
//                        _showAlertDialogadd();
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.SCALE,
//                          btnOkColor: Color_splash3,
                          btnOkText: "ok".tr(),
                          dialogType: DialogType.NO_HEADER,
                          padding: EdgeInsets.all(20),
                          body: StatefulBuilder(
                            builder: (context, setState) {
                              return TextField(
                                onChanged: (String val) {},
//                            controller: _productNameEN,
                                //keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'enterLocation'.tr(),
                                    labelStyle: new TextStyle(
                                        decorationStyle:
                                            TextDecorationStyle.solid)),
                                style: TextStyle(
                                  color: Color.fromRGBO(27, 27, 27, 0.9),
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                          title: 'This is Ignored',
                          desc: 'This is also Ignored',
                          btnOkOnPress: () {
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            // await prefs.remove('token').then((value) {
                            //   Phoenix.rebirth(AppLocale().context);
                            // });
                          },
                          btnCancelOnPress: () {},
                        )..show();
                      });
                    },
                  )..show();
                },
              ),

              Divider(
                color: Colors.grey,
                height: 2,
              ),
//              ProfileListTileWidget(
//                text: 'usageagreement'.tr(),
//                color: Colors.black,
//                icon: FontAwesomeIcons.book,
//                iconColor: Color_splash3,
//                method: () {
//                  // Navigator.push(context,
//                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
//                },
//              ),

//              Divider(
//                color: Colors.grey,
//                height: 2,
//              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "communicationways",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ).tr(),
              ),

              ProfileListTileWidget(
                text: 'telephone'.tr(),
                color: Colors.black,
                icon: FontAwesomeIcons.phone,
                iconColor: Color_splash3,
                method: () {
                  _launchURL.call("tel:" + tel);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'whatsapp'.tr(),
                color: Colors.black,
                icon: FontAwesomeIcons.whatsapp,
                iconColor: Color_splash3,
                method: () {
                  _launchURL.call(
                      'whatsapp://send?text=sample text&phone=' + tel + "'");
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'sendemail'.tr(),
                color: Colors.black,
                icon: Icons.message,
                iconColor: Color_splash3,
                method: () {
                  _launchURL.call("mailto://" + mail);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              ProfileListTileWidget(
                text: 'logout'.tr(),
                color: Colors.black,
                icon: Icons.logout,
                iconColor: Color_splash3,
                method: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    btnOkColor: Color_splash3,
                    btnOkText: "ok".tr(),
                    dialogType: DialogType.NO_HEADER,
                    padding: EdgeInsets.all(20),
                    body: StatefulBuilder(
                      builder: (context, setState) {
                        return Text(
                          "areyousurelogout",
                          style: TextStyle(fontSize: 16),
                        ).tr();
                      },
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    btnOkOnPress: () {
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.remove('token').then((value) {
                      //   Phoenix.rebirth(AppLocale().context);
                      // });
                    },
                    btnCancelOnPress: () {},
                  )..show();
                },
              ),
            ],
          ),
        ),
      ),
    );

//      Column(
//        children: [
////          myCode != null ?
//          ProfileListTileWidget(
//                  text: 'profileinformation'.tr(),
//                  color: Colors.black,
//                  icon: FontAwesomeIcons.infoCircle,
//                  iconColor: Color_splash3,
//                  method: () {
//                    Navigator.push(
//                        context,
//                        PageTransition(
//                            type: PageTransitionType.leftToRight,
//                            child: ProfileInfoScreen()));
//                  },
//                ),
////              : Container(),
//
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'favorite'.tr(),
//            color: Colors.black,
//            icon: Icons.favorite,
//            iconColor: Color_splash3,
//            method: () {
//              Navigator.push(
//                  context,
//                  PageTransition(
//                      type: PageTransitionType.leftToRight,
//                      child: ProductsScreen(
//                        isfav: true,
//                      )));
////              Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                      builder: (context) => ProductsScreen(
////                            isfav: true,
////                          )));
//            },
//          ),
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'trackingyourorder'.tr(),
//            color: Colors.black,
//            icon: Icons.track_changes,
//            iconColor: Color_splash3,
//            method: () {
//              Navigator.push(
//                  context,
//                  PageTransition(
//                      type: PageTransitionType.leftToRight,
//                      child: orderItems.length != 0
//                          ? TrackingScreen(id: orderItems[0].order.id)
//                          : Scaffold(
//                              appBar: MyAppBar(
//                                text: "trackingyourorder".tr(),
//                                method: () {
//                                  Navigator.of(context).pop();
//                                },
//                              ),
//                              body: Center(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: <Widget>[
//                                    Icon(
//                                      Icons.do_not_disturb_alt,
//                                      color: Colors.black26,
//                                      size: 125,
//                                    ),
//                                    Text(
//                                      "noorder".tr(),
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 20,
//                                          color: Colors.black26),
//                                    ),
//                                  ],
//                                ),
//                              ))));
//            },
//          ),
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'languagesettings'.tr(),
//            color: Colors.black,
//            icon: FontAwesomeIcons.language,
//            iconColor: Color_splash3,
//            method: () {
//              AwesomeDialog(
//                context: context,
//                animType: AnimType.SCALE,
//                btnOkColor: Color_splash3,
//                dialogType: DialogType.NO_HEADER,
//                padding: EdgeInsets.all(10),
//                body: StatefulBuilder(
//                  builder: (context, setState) {
//                    return Column(
//                      children: [
//                        RadioListTile<Languages>(
//                          title: const Text('العربية'),
//                          value: Languages.Arabic,
//                          groupValue: selectedLanguage,
//                          onChanged: (Languages value) {
//                            setState(() {
//                              selectedLanguage = value;
//                            });
//                          },
//                        ),
//                        RadioListTile<Languages>(
//                          title: const Text('English'),
//                          value: Languages.English,
//                          groupValue: selectedLanguage,
//                          onChanged: (Languages value) {
//                            setState(() {
//                              selectedLanguage = value;
//                            });
//                          },
//                        ),
//                      ],
//                    );
//                  },
//                ),
//                title: 'This is Ignored',
//                desc: 'This is also Ignored',
//                btnOkOnPress: () {
//                  if (selectedLanguage == Languages.Arabic) {
//                    if (context.locale != Locale('ar'))
//                      setState(() {
//                        context.locale = Locale('ar');
//                      });
//                  } else {
//                    if (context.locale != Locale('en'))
//                      setState(() {
//                        context.locale = Locale('en');
//                      });
//                  }
//                },
//              )..show();
//            },
//          ),
//          //
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'usageagreement'.tr(),
//            color: Colors.black,
//            icon: FontAwesomeIcons.book,
//            iconColor: Color_splash3,
//            method: () {
//              // Navigator.push(context,
//              //     MaterialPageRoute(builder: (context) => HomeScreen()));
//            },
//          ),
//
//          Divider(
//            color: Colors.grey,
//            height: 2,
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 20),
//            child: Text(
//              "communicationways",
//              style: TextStyle(
//                  fontSize: 16,
//                  fontWeight: FontWeight.normal,
//                  color: Colors.grey),
//            ).tr(),
//          ),
//
//          ProfileListTileWidget(
//            text: 'telephone'.tr(),
//            color: Colors.black,
//            icon: FontAwesomeIcons.phone,
//            iconColor: Color_splash3,
//            method: () {
//              _launchURL.call(tel);
//            },
//          ),
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'whatsapp'.tr(),
//            color: Colors.black,
//            icon: FontAwesomeIcons.whatsapp,
//            iconColor:Color_splash3,
//            method: () {
//              _launchURL.call('https://www.whatsapp.com/');
//            },
//          ),
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'sendemail'.tr(),
//            color: Colors.black,
//            icon: Icons.message,
//            iconColor: Color_splash3,
//            method: () {
//              _launchURL.call(mail);
//            },
//          ),
//          Divider(
//            color: Colors.grey,
//            height: 1,
//          ),
//          ProfileListTileWidget(
//            text: 'logout'.tr(),
//            color: Colors.black,
//            icon: Icons.logout,
//            iconColor: Color_splash3,
//            method: () {
//              // SharedPreferences prefs =
//              //     await SharedPreferences.getInstance();
//              // await prefs.remove('token').then((value) {
//              //   Phoenix.rebirth(AppLocale().context);
//              // });
//            },
//          ),
//        ],
//      ),
//    );
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
