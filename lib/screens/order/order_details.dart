import 'package:alayniah/data/location_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alayniah/data/orders_data.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/screens/order/no_data_screen.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OrderDetails extends StatefulWidget {
  final int id;
  OrderDetails({this.id});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    print(orderItems[widget.id].product.name);
    return Scaffold(
        appBar: MyAppBar(
            text: "orders".tr(),
            method: () {
              Navigator.of(context).pop();
            }),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
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
//              Divider(
//                thickness: 2,
//              ),
              // Padding(padding: EdgeInsets.all(10)),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text(
//                          "pickuptime".tr(),
//                          style: TextStyle(
//                            fontSize: 16,
//                          ),
//                          maxLines: 1,
//                        ),
//                        Text(
//                          "2:40 PM",
//                          style: TextStyle(
//                            fontSize: 16,
//                          ),
//                          maxLines: 1,
//                        ),
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text(
//                          "expecteddeliverytime".tr(),
//                          style: TextStyle(
//                            fontSize: 16,
//                          ),
//                          maxLines: 1,
//                        ),
//                        Text(
//                          "-",
//                          style: TextStyle(
//                            fontSize: 16,
//                          ),
//                          maxLines: 1,
//                        ),
//                      ],
//                    ),
                  ],
                ))),
//                ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                height: 45 * orderItems.length.toDouble(),
                width: MediaQuery.of(context).size.width,
                child: orderItems.length != 0
                    ? AnimationLimiter(
                  child: ListView.builder(
//                    scrollDirection: Axis.horizontal,
                    itemCount: orderItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 300),
                          child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          orderItems[index].amount.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          orderItems[index].product.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      Text(
                                        orderItems[index].subTotal.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ],
                                  )))); //snapshot.data.categories[index].image);
//                            )
//                        ),
//                      );
//                  );
                    },
                  ),
                )
//                ListView.builder(
//                        itemCount: orderItems.length,
//                        itemBuilder: (BuildContext context, int i) {
//                          return Row(
//                            children: [
//                              Padding(
//                                padding: const EdgeInsets.all(10.0),
//                                child: Text(
//                                  orderItems[i].amount.toString(),
//                                  style: TextStyle(
//                                    fontSize: 16,
//                                  ),
//                                  maxLines: 1,
//                                ),
//                              ),
//                              Expanded(
//                                child: Text(
//                                  orderItems[i].product.name,
//                                  style: TextStyle(
//                                    fontSize: 18,
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                  maxLines: 1,
//                                ),
//                              ),
//                              Text(
//                                orderItems[i].subTotal.toString(),
//                                style: TextStyle(
//                                  fontSize: 16,
//                                ),
//                                maxLines: 1,
//                              ),
//                            ],
//                          );
//                        },
//                      )
                    : NoDataScreen(),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "address".tr(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 200.0,
                      child: address_data != null
                          ? Text(
                        address_data,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontSize: 14.0),
                      )
                          : Text(""),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              // Padding(padding: EdgeInsets.all(10)),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                          orderItems[widget.id].subTotal.toString(),
                          style: TextStyle(
                            fontSize: 16,
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
                          "0",
                          style: TextStyle(
                            fontSize: 16,
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
                          "-",
                          style: TextStyle(
                            fontSize: 16,
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
                          "100",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ))),
              ),
              Divider(
                thickness: 2,
              ),
              // Padding(padding: EdgeInsets.all(10)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total".tr(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      orders[widget.id].totalAmount.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ))),
        ));
  }
}
