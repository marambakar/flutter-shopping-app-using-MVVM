import 'package:alayniah/app_locale.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/screens/account/background.dart';
import 'package:alayniah/screens/components/rounded_input_field.dart';
import 'package:alayniah/screens/components/text_field_container.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/screens/order/tracking_screen.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class PayPalScreen extends StatefulWidget {
  final int id;
  PayPalScreen({this.id});
  @override
  _PayPalScreenState createState() => _PayPalScreenState();
}

class _PayPalScreenState extends State<PayPalScreen> {
  bool serverError = false, connectedToNetwork = true;
  DateTime selectedDate;
  // Future<UserProfile> model;
  // static final now = DateTime.now();
  // final dropdownDatePicker = DropdownDatePicker(
  //   firstDate: ValidDate(year: now.year - 10, month: 1,day:1),
  //   lastDate: ValidDate(year: now.year, month: now.month,day: now.day),
  //   textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
  //   dropdownColor: Color_splash2.withOpacity(0.4),
  //   dateHint: DateHint(year: 'exp :year', month: 'exp :month'),
  //   ascending: false,
  //
  //
  // );
  @override
  void initState() {
    super.initState();
  }

  var optionMap = {
    "option0": "  VISA",
    "option1": 'PAYPAL',
    "option2": 'MASTERCARD',
  };
  var dropdownValue = "option0";
  TextEditingController cardnumberTextEditingController =
      new TextEditingController();
  TextEditingController cardholderTextEditingController =
      new TextEditingController();
  TextEditingController cvcTextEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
//
  bool error = false;
  String dropdown;

  // Future<http.Response> saveMeal(
  //     url, cardnumber, cardholder, method, cvc) async {
  //   var baseUrl = network_client.Url;
  //   return http.post(
  //     "$baseUrl/$url",
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'cardnumber': cardnumber,
  //       'cardholder': cardholder,
  //       'method': method,
  //       'cvc': cvc,
  //     }),
  //   );
  // }

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
                        "payment",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ).tr(),
                      SizedBox(height: size.height * 0.01),
                      RoundedInputField(
                        hintText: "cardholder".tr(),
                        onChanged: (value) {},
                        controller: cardholderTextEditingController,
                        icon: Icons.person,
                      ),
                      RoundedInputField(
                        hintText: "cardnumber".tr(),
                        onChanged: (value) {},
                        controller: cardnumberTextEditingController,
                        icon: Icons.credit_card,
                      ),
                      RoundedInputField(
                        hintText: "cvcnumber".tr(),
                        onChanged: (value) {},
                        controller: cvcTextEditingController,
                        icon: Icons.code,
                      ),

                      ButtonWidget(
                      text: "pay".tr(),
                      method: () async {
                        //if (_formKey.currentState.validate()) {
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.SCALE,
                          btnOkText: "ok".tr(),
                          btnCancelText: "cancel".tr(),
                          btnOkColor: Colors.green,
                          dialogType: DialogType.NO_HEADER,
                          btnCancelColor: Color_splash3,
                          padding: EdgeInsets.all(20),
                          body: StatefulBuilder(
                            builder: (context, setState) {
                              return Text(
                                "trackingorder",
                                style: TextStyle(fontSize: 16),
                              ).tr();
                            },
                          ),
                          title: 'This is Ignored',
                          desc: 'This is also Ignored',
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: TrackingScreen(
                                      id: widget.id,
                                    )));
                          },
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: MainScreen(
                                    )));
                          },
                        )..show();
                        //}
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
