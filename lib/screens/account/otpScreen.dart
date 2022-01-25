import 'package:alayniah/config.dart';
import 'package:alayniah/data/user_data.dart';
import 'package:alayniah/screens/account/background.dart';
import 'package:alayniah/screens/account/profile_info.dart';
import 'package:alayniah/screens/components/text_field_container.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController firstnameTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  TextEditingController codeTextEditingController = new TextEditingController();

  bool error = false;
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
//  final Shader linearGradient = LinearGradient(
//    colors: <Color>[Colors.grey, Color_splash3, Colors.grey],
//  ).createShader(Rect.fromLTWH(70.0, 0.0, 220.0, 70.0));
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(
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
                "code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ).tr(),
              SizedBox(height: size.height * 0.01),
              Form(
                key: _formKey,
                child: TextFieldContainer(
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: codeTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "yourcode".tr(),
                        icon: Icon(
                          Icons.code,
                          color: Color_splash3,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 12)),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "validcode".tr();
                      }
                      if (value.length < 6 || value.length > 6) {
                        return "validlength".tr();
                      }
                    },
                  ),
                ),
              ),
              ButtonWidget(
                text: "login".tr(),
                method: () async {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    error = false;
                  });
                  if (_formKey.currentState.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(
                      'myCode',
                      codeTextEditingController.text,
                    );
                    user_data.postCode =
                        double.parse(codeTextEditingController.text);
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfileInfoScreen()));
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ))),
        ),
      ),
    );
  }
}

//import 'package:alayniah/config.dart';
//import 'package:alayniah/screens/account/background.dart';
//import 'package:alayniah/screens/account/profile_info.dart';
//import 'package:alayniah/screens/components/text_field_container.dart';
//import 'package:alayniah/widget/button_widget.dart';
//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class OTPScreen extends StatefulWidget {
//  @override
//  _OTPScreenState createState() => _OTPScreenState();
//}
//
//class _OTPScreenState extends State<OTPScreen> {
//  TextEditingController firstnameTextEditingController =
//      new TextEditingController();
//  TextEditingController passwordTextEditingController =
//      new TextEditingController();
//  TextEditingController codeTextEditingController = new TextEditingController();
//
//  bool error = false;
//  bool loggedIn = false;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  final _formKey = GlobalKey<FormState>();
////  final Shader linearGradient = LinearGradient(
////    colors: <Color>[Colors.grey, Color_splash3, Colors.grey],
////  ).createShader(Rect.fromLTWH(70.0, 0.0, 220.0, 70.0));
//  final TextEditingController controller = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.transparent,
//        elevation: 0,
//      ),
//      extendBodyBehindAppBar: true,
//      body: Background(
//        child: SingleChildScrollView(
//          child: AnimationLimiter(
//              child: Column(
//                  children: AnimationConfiguration.toStaggeredList(
//            duration: const Duration(milliseconds: 375),
//            childAnimationBuilder: (widget) => SlideAnimation(
//              horizontalOffset: 50.0,
//              child: FadeInAnimation(
//                child: widget,
//              ),
//            ),
//            children: <Widget>[
//              SizedBox(height: size.height * 0.03),
//              Image.asset(
//                info_image,
//                height: 80,
//              ),
//              Text(
//                "code",
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//              ).tr(),
//              SizedBox(height: size.height * 0.01),
//              Form(
//                key: _formKey,
//                child: TextFieldContainer(
//                  child: TextFormField(
//                    style: TextStyle(color: Colors.black),
//                    controller: codeTextEditingController,
//                    keyboardType: TextInputType.number,
//                    decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: "yourcode".tr(),
//                        icon: Icon(
//                          Icons.code,
//                          color: Color_splash3,
//                        ),
//                        hintStyle:
//                            TextStyle(color: Colors.grey[700], fontSize: 12)),
//                    validator: (String value) {
//                      if (value.isEmpty) {
//                        return "validcode".tr();
//                      }
//                      if (value.length < 6 || value.length > 6) {
//                        return "validlength".tr();
//                      }
//                    },
//                  ),
//                ),
//              ),
//                  ButtonWidget(
//                  text: "login".tr(),
//                  method: () async {
//                    FocusScope.of(context).unfocus();
//                    setState(() {
//                      error = false;
//                    });
//                    if (_formKey.currentState.validate()) {
//                      SharedPreferences prefs =
//                          await SharedPreferences.getInstance();
//                      await prefs.setString(
//                        'myCode',
//                        codeTextEditingController.text,
//                      );
//                      Navigator.push(
//                          context,
//                          PageTransition(
//                              type: PageTransitionType.fade,
//                              child:ProfileInfoScreen()));
//
//                    }
//                  },
//                ),
//              SizedBox(height: size.height * 0.03),
//            ],
//          ))),
//        ),
//      ),
//    );
//  }
//}
