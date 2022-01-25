import 'package:alayniah/config.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/push_notification.dart';

class SplashAlayniah extends StatefulWidget {

  PushNotification pn;
  SplashAlayniah({this.pn});
  @override
  _SplashAlayniahState createState() => _SplashAlayniahState();
}

class _SplashAlayniahState extends State<SplashAlayniah> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds:MainScreen(index: 0,),
      image: new Image.asset(
        splash_image,
        fit: BoxFit.cover,
        color: Colors.white,
      ),
      photoSize: size_logo,

      backgroundColor: Color_splash3, //
      loaderColor: Colors.white,
    );
  }
}
