import 'package:alayniah/config.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/models/order.dart';
import 'package:alayniah/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class SingleItemOrder extends StatefulWidget {
  final int id;
  int amount;
  final Product products;
  final Order orders;
  double subTotal;
  final Function method;
  final Function methodIncrementCounter;
  final Function methodDesCounter;

  SingleItemOrder(
      {this.id,
        this.amount,
        this.products,
        this.orders,
        this.subTotal,
        this.method,
        this.methodIncrementCounter,
        this.methodDesCounter});
  @override
  _SingleItemOrderState createState() => _SingleItemOrderState();
}

class _SingleItemOrderState extends State<SingleItemOrder> {
  void _incrementCounter() {
    setState(() {
      widget.amount++;
      print(widget.amount);
      widget.subTotal = widget.amount * widget.products.price;
    });
  }

  void _desCounter() {
    setState(() {
      if (widget.amount != 0) {
        widget.amount--;
        print(widget.amount);
        widget.subTotal = widget.amount * widget.products.price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
//            Container(
//              margin: EdgeInsets.all(5),
//              height: MediaQuery.of(context).size.height/6,
//              width: MediaQuery.of(context).size.width/6+20,
//              decoration: BoxDecoration(
//                // border: Border.all(
//                //   color: Color_splash2,
//                //   width: 1,
//                // ),
//                  borderRadius: BorderRadius.all(Radius.circular(15)),
//                  image: DecorationImage(
//
//                    fit: BoxFit.cover,
//                    image: AssetImage(widget.products.image),
//                  )),
//            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Text(
                  widget.products.name ,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:[
                            Text(
                              "price",
                              style: TextStyle(fontSize: 16),
                            ).tr(),
                            Text(
                              widget.products.price.toString() ,
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.close  ,
                              color: Color_splash3,
                              size: 20,
                            ),
                            Text(
                              widget.amount.toString() ,
                              style: TextStyle(fontSize: 16),
                            ),

                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color_splash3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _incrementCounter();
                                  for (int i = 0; i < orderItems.length; i++) {
                                    if (orderItems[i].id == widget.id) {
                                      print("contains");
                                      orderItems[i].amount = widget.amount;
                                      orderItems[i].subTotal = widget.subTotal;
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Color_splash3,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  widget.amount.toString(),
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _desCounter();
                                  for (int i = 0; i < orderItems.length; i++) {
                                    if (orderItems[i].id == widget.id) {
                                      print("contains");
                                      orderItems[i].amount = widget.amount;
                                      orderItems[i].subTotal = widget.subTotal;
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: Color_splash3,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "subtotal",
                          style: TextStyle(fontSize: 16),
                        ).tr(),
                        Text(
                          widget.subTotal.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "sar",
                          style: TextStyle(fontSize: 16),
                        ).tr(),
                      ],
                    )
                  ],
                ),
//                trailing: Container(
//                  width: MediaQuery.of(context).size.width/5,
//                  height: 50 ,
//                  decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Color_splash3,
//                       width: 1,
//                     ),
//                    borderRadius: BorderRadius.all(Radius.circular(5)),
//                  ),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      GestureDetector(
//                        onTap: () {
//                          _incrementCounter();
//                          for (int i = 0; i < orderItems.length; i++) {
//                            if (orderItems[i].id == widget.id) {
//                              print("contains");
//                              orderItems[i].amount = widget.amount;
//                              orderItems[i].subTotal = widget.subTotal;
//                            }
//                          }
//                        },
//                        child: Container(
//                          padding: EdgeInsets.all(5),
//                          child: FaIcon(
//                            FontAwesomeIcons.plus,
//                            color: Color_splash3,
//                            size: 16,
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.all(10.0),
//                        child: new Text(
//                          widget.amount.toString(),
//                          style: TextStyle(fontSize: 17),
//                          textAlign: TextAlign.center,
//                        ),
//                      ),
//                      GestureDetector(
//                        onTap: () {
//                          _desCounter();
//                          for (int i = 0; i < orderItems.length; i++) {
//                            if (orderItems[i].id == widget.id) {
//                              print("contains");
//                              orderItems[i].amount = widget.amount;
//                              orderItems[i].subTotal = widget.subTotal;
//                            }
//                          }
//                        },
//                        child: Container(
//                          padding: EdgeInsets.all(5),
//                          child: FaIcon(
//                            FontAwesomeIcons.minus,
//                            color: Color_splash3,
//                            size: 16,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
                leading: GestureDetector(
                  onTap: widget.method,
                  child: Container(
//                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Color_splash3,
          thickness: 1,
        ),
      ],
    );

//      Column(
//      children: [
//        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//          Row(
//            children: [
//              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//              GestureDetector(
//                onTap: () {
//                  _incrementCounter();
//                  for (int i = 0; i < orderItems.length; i++) {
//                    if (orderItems[i].id == widget.id) {
//                      print("contains");
//                      orderItems[i].amount=widget.amount;
//                      orderItems[i].subTotal=widget.subTotal;
//
//                    }
//                  }
//                },
//                child: Container(
//                  padding: EdgeInsets.all(5),
//                  child: FaIcon(
//                    FontAwesomeIcons.plus,
//                    color: Color_splash3,
//                    size: 16,
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: new Text(
//                  widget.amount.toString(),
//                  style: TextStyle(fontSize: 17),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              GestureDetector(
//                onTap: () {
//                  _desCounter();
//                  for (int i = 0; i < orderItems.length; i++) {
//                    if (orderItems[i].id == widget.id) {
//                      print("contains");
//                      orderItems[i].amount=widget.amount;
//                      orderItems[i].subTotal=widget.subTotal;
//                    }
//                  }
//                },
//                child: Container(
//                  padding: EdgeInsets.all(5),
//                  child: FaIcon(
//                    FontAwesomeIcons.minus,
//                    color: Color_splash3,
//                    size: 16,
//                  ),
//                ),
//              ),
//            ],
//          ),
//          Center(
//            child: Text(
//              widget.products.name,
//              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//              textAlign: TextAlign.center,
//            ),
//          ),
//          Row(
//            children: [
//              Text(
//                widget.subTotal.toString(),
//                style: TextStyle(fontSize: 18),
//              ),
//              // Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//              GestureDetector(
//                onTap: widget.method,
//                child: Container(
//                  padding: EdgeInsets.symmetric(horizontal: 15),
//                  child: FaIcon(
//                    FontAwesomeIcons.trash,
//                    color: Colors.red,
//                    size: 16,
//                  ),
//                ),
//              ),
//            ],
//          )
//        ]),
//        Divider(
//          color: Color_splash3,
//          thickness: 1,
//        ),
//      ],
//    );
  }
}
