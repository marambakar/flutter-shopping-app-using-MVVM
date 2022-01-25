import 'package:alayniah/config.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/tiles/single_item_order.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alayniah/screens/order/checkout.dart';

import '../../widget/button_widget.dart';
import '../../widget/checkout_row_widget.dart';
import '../account/paypal_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  bool error = false;
  double supTotal = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < orderItems.length; i++) {
      supTotal += orderItems[i].subTotal;
    }
    // initialize();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        text: "yourcart".tr(),
        method: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: MainScreen()));
        },
      ),
      body: SingleChildScrollView(
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
              height: MediaQuery.of(context).size.height - 200,
              margin: EdgeInsets.only(top: 10),
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: orderItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                                child: SingleItemOrder(
                                    id: orderItems[index].id,
                                    products: orderItems[index].product,
                                    amount: orderItems[index].amount,
                                    subTotal: orderItems[index].subTotal,
                                    method: () {
                                      print("orderItems[index].id = " +
                                          orderItems[index].id.toString());
                                      setState(() {
                                        orderItems.removeWhere((item) =>
                                            item.id == orderItems[index].id);
                                        print("index = " + index.toString());
                                      }); //snapshot.data.categories[index].image);
                                    }))));
//                    )
//                  );
                  },
                ),
              ),
//              ListView.builder(
//                shrinkWrap: true,
//                itemCount: orderItems.length,
//                itemBuilder: (context, index) {
//                  return SingleItemOrder(
//                    id: orderItems[index].id,
//                    products: orderItems[index].product,
//                    amount: orderItems[index].amount,
//                    subTotal: orderItems[index].subTotal,
//                    method: () {
//                      print("orderItems[index].id = " +
//                          orderItems[index].id.toString());
//                      setState(() {
//                        orderItems.removeWhere(
//                            (item) => item.id == orderItems[index].id);
//                        print("index = " + index.toString());
//                      });
//                    },
//                    // methodIncrementCounter: () {
//                    //   print(orderItems[index].amount);
//                    //
//                    //   // setState(() {
//                    //   //   _incrementCounter(orderItems[index].amount);
//                    //   // });
//                    // },
//                    // methodDesCounter: () {
//                    //   // setState(() {
//                    //     print(orderItems[index].amount);
//                    //     _desCounter(orderItems[index].amount);
//                    //   // });
//                    // },
//                  );
//                },
//              ),
            ),
//            ButtonWidget(
//              text: "checkout".tr(),
//              method: () {
//                FocusScope.of(context).unfocus();
//                setState(() {
//                  Center(
//                    child: SizedBox(
//                      child: CircularProgressIndicator(),
//                      height: 24,
//                      width: 24,
//                    ),
//                  );
//                  error = false;
//                });
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.fade,
//                        child:PayPalScreen(
//                          id: orderItems[0].order.id,
//                        )));
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
//              },
//            ),
//            CheckoutRowWidget(
//              text: "subtotal".tr(),
//              value: supTotal,
//            ),
//            CheckoutRowWidget(
//              text: "discount".tr(),
//              value: myArrPro[0]["pro_price"],
//            ),
//            CheckoutRowWidget(
//              text: "tax".tr(),
//              value: myArrPro[0]["pro_price"],
//            ),
//            CheckoutRowWidget(
//              text: "deliveryfee".tr(),
//              value: myArrPro[0]["pro_price"],
//            ),
//            Divider(color: Color_splash3),
//            CheckoutRowWidget(
//              text: "totalprice".tr(),
//              value: myArrPro[0]["pro_price"],
//              val: 1,
//            ),
          ],
        ))),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Checkout(
                        id: orderItems[0].order.id,
                      )));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: 60.0,
          decoration: BoxDecoration(
            color: Color_splash3,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200],
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(5, 5))
            ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.shopping_cart, color: Colors.white, size: 25.0),
              Expanded(
                child: Text(""),
              ),
              // GestureDetector(
              //   child:
              Text('continue',
                      style: TextStyle(color: Colors.white, fontSize: 20))
                  .tr(),
              // ,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
