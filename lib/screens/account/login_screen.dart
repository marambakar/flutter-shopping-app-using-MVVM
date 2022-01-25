//import 'package:alayniah/config.dart';
//import 'package:alayniah/data/user_data.dart';
//import 'package:alayniah/screens/account/background.dart';
//import 'package:alayniah/screens/account/otpScreen.dart';
//import 'package:alayniah/screens/components/rounded_input_field.dart';
//import 'package:alayniah/screens/components/text_field_container.dart';
//import 'package:alayniah/widget/button_widget.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//import 'package:alayniah/data/user_data.dart';
//class LoginScreen extends StatefulWidget {
//  @override
//  _LoginScreenState createState() => _LoginScreenState();
//}
//
//class _LoginScreenState extends State<LoginScreen> {
//  TextEditingController firstnameTextEditingController =
//  new TextEditingController();
//  TextEditingController passwordTextEditingController =
//  new TextEditingController();
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
//  String initialCountry = 'SY';
//  PhoneNumber number = PhoneNumber(isoCode: 'SY');
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
//                    duration: const Duration(milliseconds: 375),
//                    childAnimationBuilder: (widget) => SlideAnimation(
//                      horizontalOffset: 50.0,
//                      child: FadeInAnimation(
//                        child: widget,
//                      ),
//                    ),
//                    children: <Widget>[
//                      SizedBox(height: size.height * 0.03),
//                      Image.asset(
//                        info_image,
//                        height: 80,
//                      ),
//                      Text(
//                        "login",
//                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                      ).tr(),
//                      SizedBox(height: size.height * 0.01),
//                      Form(
//                        key: _formKey,
//
//                        child: TextFieldContainer(
////                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
//                          child: InternationalPhoneNumberInput(
//                            onInputChanged: (PhoneNumber number) {
//                              print(number.phoneNumber);
//                            },
//                            onInputValidated: (bool value) {
//                              print(value);
//                            },
//                            selectorConfig: SelectorConfig(
//                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
////                              backgroundColor: Colors.grey[200],
//                              useEmoji: true,
//                            ),
//                            selectorTextStyle: TextStyle(color: Colors.black),
//                            ignoreBlank: false,
//                            autoValidateMode: AutovalidateMode.disabled,
//                            initialValue: number,
//                            hintText: "phonenumber",
//                            textFieldController:
//                            controller == null ? Text("") : controller,
//                            textStyle: TextStyle(color: Colors.black),
//                            inputDecoration: new InputDecoration(
//                                focusedBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(color: Color_splash3, width: 1),
//                                ),
//                                enabledBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(color: Color_splash3, width: 1),
//                                )),
//                            formatInput: false,
//                            keyboardType: TextInputType.numberWithOptions(
//                                signed: true, decimal: true),
//                            validator: (String value) {
//                              if (value.isEmpty) {
//                                return "validphone".tr();
//                              }
//                              if (value.length < 10 || value.length > 10) {
//                                return "validlength".tr();
//                              }
//                              if (value[0] != '9') {
//                                return "validlength".tr();
//                              }
//                            },
//                          ),
//                        ),
//                      ),
//                      ButtonWidget(
//                        text: "login".tr(),
//                        method: () async {
//                          FocusScope.of(context).unfocus();
//                          setState(() {
//                            error = false;
//                          });
//                          if (_formKey.currentState.validate()) {
//                            SharedPreferences prefs =
//                            await SharedPreferences.getInstance();
//                            await prefs.setString('phone', controller.text);
//                            user_data.phoneNumber=double.parse(controller.text);
//                            Navigator.push(
//                                context,
//                                PageTransition(
//                                    type: PageTransitionType.fade, child: OTPScreen()));
//                          }
//                        },
//                      ),
//                      SizedBox(height: size.height * 0.03),
//                    ],
//                  ))),
//        ),
////            ),
////          ),
////            Positioned(
////              top:0.0,
////              left: 0.0,
////              right: 0.0,
////
//////              height: MediaQuery.of(context).size.height,
////              child: Image.asset(info_image,fit: BoxFit.fitWidth,),
////            )
////        ],
////      ),
//      ),
//    );
//  }
//}

import 'package:alayniah/config.dart';
import 'package:alayniah/screens/account/background.dart';
import 'package:alayniah/screens/account/otpScreen.dart';
import 'package:alayniah/screens/account/paypal_screen.dart';
import 'package:alayniah/screens/account/profile_info.dart';
import 'package:alayniah/screens/components/rounded_input_field.dart';
import 'package:alayniah/screens/components/text_field_container.dart';
import 'package:alayniah/screens/home_screen.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
   User _user;
  FacebookLogin facebookLogin = FacebookLogin();
  TextEditingController firstnameTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
 // FirebaseAuth _auth = FirebaseAuth.instance;
  final otpController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  bool showLoading = false;
  String verificationId;

  // FirebaseAuth _auth = FirebaseAuth.instance;
  bool error = false;
  bool loggedIn = false;
  bool isLogged = false;
  // FirebaseUser myUser;
  // void _logInTwitter() {
  //   _loginWithTwitter().then((response) {
  //     if (response != null) {
  //       myUser = response;
  //       isLogged = true;
  //       setState(() {});
  //     }
  //   });
  // }
  //
  // Future<FirebaseUser> _loginWithTwitter() async {
  //   var twitterLogin = new TwitterLogin(
  //     consumerKey: 'Y2MyConsumerKeyYKX',
  //     consumerSecret: 'xYXUMyConsumerSecretKeyjFAJZMyConsumerSecretKeyS3i',
  //   );
  //
  //   final TwitterLoginResult result = await twitterLogin.authorize();
  //
  //   switch (result.status) {
  //     case TwitterLoginStatus.loggedIn:
  //       var session = result.session;
  //       FirebaseUser user = await _auth.signInWithTwitter(
  //           authToken: session.token, authTokenSecret: session.secret);
  //       return user;
  //       break;
  //     case TwitterLoginStatus.cancelledByUser:
  //       debugPrint(result.status.toString());
  //       return null;
  //       break;
  //     case TwitterLoginStatus.error:
  //       debugPrint(result.errorMessage.toString());
  //       return null;
  //       break;
  //   }
  //   return null;
  // }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
//  final Shader linearGradient = LinearGradient(
//    colors: <Color>[Colors.grey, Color_splash3, Colors.grey],
//  ).createShader(Rect.fromLTWH(70.0, 0.0, 220.0, 70.0));
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SY';
  PhoneNumber number = PhoneNumber(isoCode: 'SY');
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Background(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
//         SingleChildScrollView(
//           child: AnimationLimiter(
//               child: Column(
//                   children: AnimationConfiguration.toStaggeredList(
//             duration: const Duration(milliseconds: 375),
//             childAnimationBuilder: (widget) => SlideAnimation(
//               horizontalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: widget,
//               ),
//             ),
//             children: <Widget>[
//               SizedBox(height: size.height * 0.03),
//               Image.asset(
//                 info_image,
//                 height: 80,
//               ),
//               Text(
//                 "login",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//               ).tr(),
//               SizedBox(height: size.height * 0.01),
// //               Form(
// //                 key: _formKey,
// //                 child: TextFieldContainer(
// // //                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
// //                   child: InternationalPhoneNumberInput(
// //                     onInputChanged: (PhoneNumber number) {
// //                       print(number.phoneNumber);
// //                     },
// //                     onInputValidated: (bool value) {
// //                       print(value);
// //                     },
// //                     selectorConfig: SelectorConfig(
// //                       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
// // //                      backgroundColor: Colors.grey[200],
// //                       useEmoji: true,
// //                     ),
// //                     selectorTextStyle: TextStyle(color: Colors.black),
// //                     ignoreBlank: false,
// //                     autoValidateMode: AutovalidateMode.disabled,
// //                     initialValue: number,
// //                     hintText: "phonenumber",
// //                     textFieldController:
// //                         controller == null ? Text("") : controller,
// //                     textStyle: TextStyle(color: Colors.black),
// //                     inputDecoration: new InputDecoration(
// //                         focusedBorder: UnderlineInputBorder(
// //                           borderSide:
// //                               BorderSide(color: Color_splash3, width: 1),
// //                         ),
// //                         enabledBorder: UnderlineInputBorder(
// //                           borderSide:
// //                               BorderSide(color: Color_splash3, width: 1),
// //                         )),
// //                     formatInput: false,
// //                     keyboardType: TextInputType.numberWithOptions(
// //                         signed: true, decimal: true),
// //                     validator: (String value) {
// //                       if (value.isEmpty) {
// //                         return "validphone".tr();
// //                       }
// //                       if (value.length < 10 || value.length > 10) {
// //                         return "validlength".tr();
// //                       }
// //                       if (value[0] != '9') {
// //                         return "validlength".tr();
// //                       }
// //                     },
// //                   ),
// //                 ),
// //               ),
// //               Form(
// //                 key: _formKey,
// //                 child: TextFieldContainer(
// //                   child: TextFormField(
// //                     style: TextStyle(color: Colors.black),
// //                     keyboardType: TextInputType.number,
// //                     decoration: InputDecoration(
// //                       border: InputBorder.none,
// //                       hintText: "email/phone".tr(),
// //                       // icon: Icon(
// //                       //   Icons.phone,
// //                       //   color: Color_splash3,
// //                       // ),
// //                       // hintStyle:
// //                       // TextStyle(color: Colors.black, fontSize: 12)
// //                     ),
// //                     validator: (String value) {
// //                       if (value.isEmpty) {
// //                         return "validphone".tr();
// //                       }
// //                       if (value[0] != '9') {
// //                         return "validlength".tr();
// //                       }
// //                     },
// //                   ),
// //                 ),
// //               ),
// //               TextFieldContainer(
// //                 child: TextFormField(
// //                   style: TextStyle(color: Colors.black),
// //                   keyboardType: TextInputType.number,
// //                   decoration: InputDecoration(
// //                     border: InputBorder.none,
// //                     hintText: "password".tr(),
// //                     // icon: Icon(
// //                     //   Icons.phone,
// //                     //   color: Color_splash3,
// //                     // ),
// //                     // hintStyle:
// //                     // TextStyle(color: Colors.black, fontSize: 12)
// //                   ),
// //                   validator: (String value) {
// //                     if (value.isEmpty) {
// //                       return "validphone".tr();
// //                     }
// //                     if (value[0] != '9') {
// //                       return "validlength".tr();
// //                     }
// //                   },
// //                 ),
// //               ),
//               ButtonWidget(
//                 text: "loginwithphonenumber".tr(),
//                 method: () async {
//                   FocusScope.of(context).unfocus();
//                   setState(() {
//                     error = false;
//                   });
//                   if (_formKey.currentState.validate()) {
//                     SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                     await prefs.setString('phone', controller.text);
//                     Navigator.push(
//                         context,
//                         PageTransition(
//                             type: PageTransitionType.fade, child: OTPScreen()));
//                   }
//                 },
//               ),
// //              SizedBox(height: size.height * 0.008,),
//               Text(
//                 "or",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Color_splash3,
//                     fontWeight: FontWeight.bold),
//               ),
// //              SizedBox(height: size.height *0.008
// //              ,),
// //              Center(
// //                child: Row(
// //                  mainAxisAlignment: MainAxisAlignment.spaceAround,
// //
// //                  children: [
// //                    IconButton(
// //                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
// //                        icon: FaIcon(FontAwesomeIcons.facebook,size: 50,
// //                          color: Colors.blue,),
// //                        onPressed: () { print("Pressed");
// //                        _launchInBrowser(facebookurl);
// //                        }
// //                    ),
// //                    IconButton(
// //                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
// //                        icon: FaIcon(FontAwesomeIcons.google,size: 50,color: Colors.green,),
// //                        onPressed: () { print("Pressed");
// //                        _launchInBrowser(googleurl);
// //                        }
// //                    ),
// //                    IconButton(
// //                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
// //                        icon: FaIcon(FontAwesomeIcons.apple,size: 50,color: Colors.grey,),
// //                        onPressed: () { print("Pressed");
// //                        _launchInBrowser(appleurl);
// //                        }
// //                    )
// //                  ],
// //                ),
// //              ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {
//                       _launchURL.call(facebookurl);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.transparent),
//                       child: FaIcon(
//                         FontAwesomeIcons.facebook,
//                         color: Colors.blue.shade700,
//                         size: 40,
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () async { googleLogin();
//
//                       // try {
//                       //   await googleSignIn.signIn();
//                       //
//                       // }catch(err){
//                       //   print("######faild dign in ");
//                       // }
//                       // _launchURL.call(googleurl);
//
//                       // signInWithGoogle().then((user) => {
//                       //   // this.user = user,
//                       //   Navigator.push(context,
//                       //       MaterialPageRoute(builder: (context) => HomeScreen()))
//                       // });
//                     },
//
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.transparent),
//                       child: FaIcon(FontAwesomeIcons.google,
//                           color: Colors.red, size: 40),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       _launchURL.call(appleurl);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.transparent),
//                       child: FaIcon(FontAwesomeIcons.apple,
//                           color: Colors.grey, size: 40),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       // _launchURL.call(twitterurl);
//                       // _logInTwitter();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.transparent),
//                       child: FaIcon(FontAwesomeIcons.twitter,
//                           color: Colors.lightBlue, size: 40),
//                     ),
//                   ),
//
//                 ],
//               ),
//
//             ],
//           ))),
//         ),
//            ),
//          ),
//            Positioned(
//              top:0.0,
//              left: 0.0,
//              right: 0.0,
//
////              height: MediaQuery.of(context).size.height,
//              child: Image.asset(info_image,fit: BoxFit.fitWidth,),
//            )
//        ],
//      ),
//       ),
        ));
  }

  googleLogin() async {
    final googleSignIn = GoogleSignIn();

    GoogleSignInAccount _user;
    // GoogleSignInAccount get user => _user;
    // Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    print("*********googleUser**************" + _user.email.toString());

    final googleAuth = await googleUser.authentication;
    print("*********googleAuth**************" + googleAuth.idToken.toString());
    print("*********googleAuth.accessToken**************" +
        googleAuth.accessToken.toString());

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    print("*********credential**************" +
        credential.accessToken.toString());
    print("*********credentialidToken**************" +
        credential.idToken.toString());

    var user = await FirebaseAuth.instance.signInWithCredential(credential);

    if(user!=null){
      SharedPreferences prefs =
      await SharedPreferences.getInstance();
      await prefs.setString('myCode', user.credential.token.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProfileInfoScreen(fromlogin: true,)));

    }


    // notifyListeners();
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
    }
  }
String completeNumber="";
  String numberCode="";
  getMobileFormWidget(context) {
    Size size = MediaQuery.of(context).size;

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
        // Form(
        //   key: _formKey,
        //   child: TextFieldContainer(
        //     child: Column(
        //       children: [
        SizedBox(height: size.height * 0.03),
        Image.asset(
          info_image,
          height: 80,
        ),
        Text(
          "login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ).tr(),
        SizedBox(height: size.height * 0.01),
        // TextFieldContainer(
        //   child: TextFormField(
        //     controller: controller,
        //     style: TextStyle(color: Colors.black),
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       hintText: "phone".tr(),
        //       // icon: Icon(
        //       //   Icons.phone,
        //       //   color: Color_splash3,
        //       // ),
        //       // hintStyle:
        //       // TextStyle(color: Colors.black, fontSize: 12)
        //     ),
        //     validator: (String value) {
        //       if (value.isEmpty) {
        //         return "validphone".tr();
        //       }
        //       if (value[0] != '9') {
        //         return "validlength".tr();
        //       }
        //     },
        //   ),
        // ),
        TextFieldContainer(
//                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
              setState(() {
                completeNumber=number.phoneNumber;
                numberCode =number.isoCode;
              });

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
              // if (value[0] != '9') {
              //   return "validlength".tr();
              // }
            },
          ),
        ),
        // TextFieldContainer(
        //   child: TextFormField(
        //     style: TextStyle(color: Colors.black),
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //       border: InputBorder.none,
        //       hintText: "password".tr(),
        //       // icon: Icon(
        //       //   Icons.phone,
        //       //   color: Color_splash3,
        //       // ),
        //       // hintStyle:
        //       // TextStyle(color: Colors.black, fontSize: 12)
        //     ),
        //     validator: (String value) {
        //       if (value.isEmpty) {
        //         return "validphone".tr();
        //       }
        //       if (value[0] != '9') {
        //         return "validlength".tr();
        //       }
        //     },
        //   ),
        // ),

        //       ],
        //     ),
        //   ),
        // ),

        ButtonWidget(
          text: "loginwithphonenumber".tr(),
          method: () async {
            setState(() {
              showLoading = true;
            });
              print("completeNumber:"+completeNumber);
            await _auth.verifyPhoneNumber(
              phoneNumber: completeNumber,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(verificationFailed.message.toString())));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
        ),
        Text(
          "or",
          style: TextStyle(
              fontSize: 20, color: Color_splash3, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                print("here facebook log");
                initiateFacebookLogin();

                //     _launchURL.call(facebookurl);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent),
                child: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue.shade700,
                  size: 40,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                googleLogin();

                // try {
                //   await googleSignIn.signIn();
                //
                // }catch(err){
                //   print("######faild dign in ");
                // }
                // _launchURL.call(googleurl);

                // signInWithGoogle().then((user) => {
                //   // this.user = user,
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => HomeScreen()))
                // });
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent),
                child: FaIcon(FontAwesomeIcons.google,
                    color: Colors.red, size: 40),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL.call(appleurl);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent),
                child: FaIcon(FontAwesomeIcons.apple,
                    color: Colors.grey, size: 40),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     // _launchURL.call(twitterurl);
            //     // _logInTwitter();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: Colors.transparent),
            //     child: FaIcon(FontAwesomeIcons.twitter,
            //         color: Colors.lightBlue, size: 40),
            //   ),
            // ),
          ],
        ),
        // FlatButton(
        //   onPressed: () async {
        //     setState(() {
        //       showLoading = true;
        //     });
        //
        //     await _auth.verifyPhoneNumber(
        //       phoneNumber: controller.text,
        //       verificationCompleted: (phoneAuthCredential) async {
        //         setState(() {
        //           showLoading = false;
        //         });
        //         //signInWithPhoneAuthCredential(phoneAuthCredential);
        //       },
        //       verificationFailed: (verificationFailed) async {
        //         setState(() {
        //           showLoading = false;
        //         });
        //         _scaffoldKey.currentState.showSnackBar(SnackBar(
        //             content: Text(verificationFailed.message.toString())));
        //       },
        //       codeSent: (verificationId, resendingToken) async {
        //         setState(() {
        //           showLoading = false;
        //           currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
        //           this.verificationId = verificationId;
        //         });
        //       },
        //       codeAutoRetrievalTimeout: (verificationId) async {},
        //     );
        //   },
        //   child: Text("SEND"),
        //   color: Colors.blue,
        //   textColor: Colors.white,
        // ),
      ],
    ))));
  }

  getOtpFormWidget(context) {
    Size size = MediaQuery.of(context).size;

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
        SizedBox(height: size.height * 0.03),
        Image.asset(
          info_image,
          height: 80,
        ),
        Text(
          "login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ).tr(),
        SizedBox(height: size.height * 0.01),
        TextFieldContainer(
          child: TextFormField(
            controller: otpController,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "otp".tr(),
              // icon: Icon(
              //   Icons.phone,
              //   color: Color_splash3,
              // ),
              // hintStyle:
              // TextStyle(color: Colors.black, fontSize: 12)
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ButtonWidget(
          text: "login".tr(),
          method: () async {
            // print("number"+number.toString());
            SharedPreferences prefs =
           await SharedPreferences.getInstance();
            await prefs.setString('phone', controller.text);

            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
            await prefs.setString('myCode', phoneAuthCredential.token.toString());
            await prefs.setString('numberCode', numberCode.toString());
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileInfoScreen(fromlogin: true,)));
          },
        ),
      ],
    ))));
  }


  Future<UserCredential> firebaseAuthWithFacebook({ FacebookAccessToken token}) async {

    AuthCredential credential= FacebookAuthProvider.credential(token.token);
    UserCredential firebaseUser = await _auth.signInWithCredential(credential);
    return firebaseUser;
  }
  void initiateFacebookLogin() async {
    final FirebaseAuth _fAuth = FirebaseAuth.instance;
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logIn(['email']);
    Map _userObj = {};

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        // onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        //  onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var graphResponse = await http.get( Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
            .accessToken.token}'));
        var firebaseUser = await firebaseAuthWithFacebook(
            token: facebookLoginResult.accessToken);
        // var User = await firebaseAuthWithFacebook(
        //     token: facebookLoginResult.accessToken);

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileInfoScreen(fromlogin: true,)));

        // onLoginStatusChanged(true, profileData: profile);
        break;
        // onLoginStatusChanged(true);
        break;
    }
  }
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      print("looooginnnn");
      this.isLoggedIn = isLoggedIn;
    });
  }


  Future loginWithfacebook(FacebookLoginResult result) async {
    print("creeeeeeeeeeeeeeeeeeeednnnnnnnn");
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
    FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      isSignIn = true;
      _user = a.user;
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        facebookLogin.logOut();
        isSignIn = false;
      });
    });
  }
}
