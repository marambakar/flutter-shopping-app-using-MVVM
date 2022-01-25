import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/data/orders_data.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/screens/order/no_data_screen.dart';
import 'package:alayniah/tiles/tracking_time_tiles.dart';
import 'package:alayniah/data/tracking_data.dart';
import 'package:alayniah/config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:toast/toast.dart';

class TrackingScreen extends StatefulWidget {
  final int id;
  TrackingScreen({this.id});
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<TrackingScreen> {
  Widget getTimeLine() {
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: Colors.white,
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
          TrackingTimeTiles(
            lineX: 0.2,
            heightContainer: MediaQuery.of(context).size.height / 6,
            title: "orderreceived".tr(),
            subTitle: tracking.received,
          ),
          TrackingTimeTiles(
            lineX: 0.2,
            heightContainer: MediaQuery.of(context).size.height / 6,
            title: "ontheway".tr(),
            subTitle: tracking.ontheway,
          ),
          TrackingTimeTiles(
            lineX: 0.2,
            heightContainer: MediaQuery.of(context).size.height / 6,
            title: "delivered".tr(),
            subTitle: tracking.delivered,
          )
        ],
    ))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
          text: "trackingyourorder".tr(),
          method: () {
            Navigator.of(context).pop();
          }),
      body: orderItems.length != 0
          ? SingleChildScrollView(
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      splash_image,
                      fit: BoxFit.cover,
                      color: Color_splash3,
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.height / 6,
                    ),
                  ),
                  Text(
                    "invoice".tr() + tracking.invoice,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  getTimeLine(),
                  ButtonWidget(
                    text: "cancelorder".tr(),
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
                              "theorderdeleted",
                              style: TextStyle(fontSize: 16),
                            ).tr();
                          },
                        ),
                        title: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnOkOnPress: () {
                          for (int i = 0; i < orderItems.length; i++) {
                            orderItems.removeWhere(
                                    (item) => item.id == orderItems[i].order.id);
                          }
                          orders.removeWhere((item) => item.id == widget.id);
                          Toast.show(
                            "ordersuccess".tr(),
                            context,
                            backgroundColor: Color_splash3,
                            gravity: Toast.CENTER,
                            duration: Toast.LENGTH_LONG,
                          );
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: MainScreen()));
                        },
                        btnCancelOnPress: () {



                        },
                      )..show();
                    },
                  )
                ],
              ))),
            )
          : NoDataScreen(),
    );
  }
}
