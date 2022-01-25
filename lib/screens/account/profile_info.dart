import 'dart:async';
import 'dart:typed_data';

import 'package:alayniah/config.dart';
import 'package:alayniah/data/location_data.dart';
import 'package:alayniah/data/user_data.dart';
import 'package:alayniah/screens/account/background.dart';
import 'package:alayniah/screens/account/location_screen.dart';
import 'package:alayniah/screens/account/paypal_screen.dart';
import 'package:alayniah/screens/components/rounded_input_field.dart';
import 'package:alayniah/screens/components/text_field_container.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ProfileInfoScreen extends StatefulWidget {
  final bool fromlogin;
  ProfileInfoScreen({this.fromlogin});
  @override
  _ProfileInfoScreenState createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  var dropdownValue = "option0";
  TextEditingController firstnameTextEditingController =
      new TextEditingController();
  TextEditingController lastnameTextEditingController =
      new TextEditingController();
  TextEditingController locationTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();

  String initialCountry = 'SY';
  PhoneNumber number ;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

//
  bool error = false;
//  final Shader linearGradient = LinearGradient(
//    colors: <Color>[Colors.grey, Color_splash3, Colors.grey],
//  ).createShader(Rect.fromLTWH(70.0, 0.0, 220.0, 70.0));
//  String address;
  String latitude, longitude;
//  Location location = new Location();
//  LocationData _locationData;

  bool _serviceEnabled;
//  PermissionStatus _permissionGranted;
//  Future<String> _getUserLocation() async {
//    _serviceEnabled = await location.serviceEnabled();
//    if (!_serviceEnabled) {
//      _serviceEnabled = await location.requestService();
//      if (!_serviceEnabled) {
//        return "" ;
//      }
//    }
//
//    _permissionGranted = await location.hasPermission();
//    if (_permissionGranted == PermissionStatus.denied) {
//      _permissionGranted = await location.requestPermission();
//      if (_permissionGranted != PermissionStatus.granted) {
//        return "";
//      }
//    }
//
//    _locationData = await location.getLocation();
//    print("vvvv" + _locationData.toString());
//
//
//    String pal=await  _getaddress();
//    setState(()  {
//      latitude_data=  _locationData.latitude;
//      longitude_data=  _locationData.longitude;
//      address_data = pal;
//
//    });
//    print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn+"+pal);
//    return pal;
//
//    // Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
//  }
//  Future<String> _getaddress() async {
//    final coordinates = new Coordinates(latitude_data,longitude_data);
//
//    var addresses =
//    await Geocoder.local.findAddressesFromCoordinates(coordinates);
//    var first = addresses.first;
//
//    print("${first.featureName} : ${first.addressLine}");
//    return "${first.addressLine}";
//  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getUserLocation().whenComplete(() => address_data);

    setState(() {
      SharedPreferences.getInstance().then((prefs) {
        firstnameTextEditingController.text =
            (prefs.getString('firstname') ?? null);
        lastnameTextEditingController.text =
            (prefs.getString('lastname') ?? null);
        emailTextEditingController.text = (prefs.getString('email') ?? null);
        controller.text = (prefs.getString('phone') ?? null);
        print("phone is :" + (prefs.getString('phone') ?? null).toString());
        String code =(prefs.getString('numberCode') ?? null).toString();
        setState(() {
          number= PhoneNumber(isoCode: code);
        });

//        latitude =(prefs.getString('latitude'));
//        longitude=(prefs.getString('longitude'));
//        if(latitude !=null &&longitude!=null ){
//          print("************************");
//          print("prefs latitude in profile  :"+(prefs.getString('latitude') ?? null).toString() +"prefs longitude :"+(prefs.getString('longitude') ?? null).toString() );
        if (address_data == null) {
          _getCurrentLocation();
//              _getUserLocation();

        }

        print("****in profile :" +
            latitude_data.toString() +
            longitude_data.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//    _getAddressFromLatLng();

//      _getAddressFromLatLng();
//    _getUserLocation().whenComplete(() => address_data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  info_image,
                  height: 80,
                ),
                Text(
                  "login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ).tr(),
                SizedBox(height: size.height * 0.0001),
                RoundedInputField(
                  hintText: "firstname".tr(),
                  onChanged: (value) {},
                  controller: firstnameTextEditingController,
                  icon: Icons.person,
                ),
                RoundedInputField(
                  hintText: "lastname".tr(),
                  onChanged: (value) {},
                  controller: lastnameTextEditingController,
                  icon: Icons.person,
                ),
                RoundedInputField(
                  hintText: "email".tr(),
                  onChanged: (value) {},
                  controller: emailTextEditingController,
                  icon: Icons.email,
                ),
                TextFieldContainer(
//                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                              backgroundColor: Colors.grey[200],
                      useEmoji: true,
                    ),
                    selectorTextStyle: TextStyle(color: Colors.black),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    initialValue: number,
                    hintText: "phonenumber",
                    textFieldController:
                        controller == null ? Text("") : controller,
                    textStyle: TextStyle(color: Colors.black),
                    inputDecoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color_splash3, width: 1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color_splash3, width: 1),
                        )),
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "validphone".tr();
                      }
                      if (value.length < 9 || value.length > 9) {
                        return "validlength".tr();
                      }

                    },
                  ),
                ),
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 0.06,
                          vertical: size.height * 0.01),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.02,
                          vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        color: Color_splash3.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color_splash3,
                          ),
                          address_data != null
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 160,
                                  child: ReadMoreText(
                                    address_data,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                    trimMode: TrimMode.Line,
                                    trimLines: 2,
                                    colorClickableText: Color_splash3,
                                    trimCollapsedText: 'showmore'.tr(),
                                    trimExpandedText: 'showless'.tr(),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text("your location").tr(),
                                )
                        ],
                      ),
                    ),
                    onTap: () {
//               _getUserLocation();

//                _getAddressFromLatLng(double.parse(latitude) ,double.parse(longitude) );
                      return showDialogregestrationMap(context);
                    }),
                ButtonWidget(
                  text: "save".tr(),
                  method: () async {
//                             FocusScope.of(context).unfocus();
//                             setState(() {
//                               error = false;
//                             });
                    if (_formKey.currentState.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                          'firstname', firstnameTextEditingController.text);
                      await prefs.setString(
                          'lastname', lastnameTextEditingController.text);
                      await prefs.setString(
                          'email', emailTextEditingController.text);
                      await prefs.setString('phone', controller.text);

                      user_data.firstName = firstnameTextEditingController.text;
                      user_data.lastName = lastnameTextEditingController.text;
                      user_data.email = emailTextEditingController.text ?? null;

                    widget.fromlogin==false?  Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: MainScreen())):Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: PayPalScreen()));
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ))),
          ),
        ),
      ),
    );
  }

  MapType _currentMapType = MapType.normal;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  static LatLng _center;
  Set<Marker> _markers = {};
  LatLng _lastMapPosition;

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
