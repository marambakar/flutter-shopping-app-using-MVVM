import 'package:alayniah/config.dart';
import 'package:alayniah/data/offers_data.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/data/orders_data.dart';
import 'package:alayniah/data/products_data.dart';
import 'package:alayniah/models/offer.dart';
import 'package:alayniah/models/order.dart';
import 'package:alayniah/models/order_item.dart';
import 'package:alayniah/models/product.dart';
import 'package:alayniah/models/user.dart';
import 'package:alayniah/screens/account/login_screen.dart';
import 'package:alayniah/screens/product/product_screen.dart';
import 'package:alayniah/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final int id;
  final int screen;
  final bool offer;

  ProductDetail({this.id, this.screen, this.offer = false});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
//  String myCode = "";
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _desCounter() {
    setState(() {
      if (_counter != 1) {
        _counter--;
      }
    });
  }

  OrderItem orderItem = new OrderItem();
  Order orderTemp = new Order();
  Product product;
  Offer offer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.offer) {
        offer = offers.elementAt(widget.id);
        product = offer.product;
      } else {
        product = products.elementAt(widget.id - 1);
      }
      for (int i = 0; i < orders.length; i++) {
        if (orderItems[i].product.id == product.id) {
          setState(() {
            _counter = orderItems[i].amount;
          });
        }
      }

//      SharedPreferences.getInstance().then((prefs) {
//        String code1 = (prefs.getString('myCode') ?? null);
//        myCode = code1;
//        // print(" code is :" + code1);
//      });
    });
  }

  Widget headerBuild() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey[100],
                  //       spreadRadius: 1,
                  //       blurRadius: 1,
                  //       offset: Offset(0, 1))
                  // ],
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color_splash3,
                  ),
                  onPressed: () {
                    //lastproduct
                    if (widget.screen == 1) {
                      Navigator.of(context).pop();
                    }
                    //favorit
                    if (widget.screen == 2) {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: ProductsScreen(
                                isfav: true,
                              )));
                    }
                    //cat
                    if (widget.screen == 3) {
                      Navigator.of(context).pop();
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         type: PageTransitionType.fade,
                      //         child: ProductsScreen(
                      //           isfav: false,
                      //           catid: product.category.id,
                      //         ))
                      // );
                    }
                  })),
          Expanded(child: Text("")),
          product.isfav
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.grey[100],
                      //       spreadRadius: 1,
                      //       blurRadius: 1,
                      //       offset: Offset(0, 1))
                      // ],
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          product.set_isFav(false);
                          favProduct.removeWhere(
                              (item) => item.id == products[widget.id - 1].id);
                        });
                      }))
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[100],
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          product.set_isFav(true);
                          favProduct.add(products[widget.id - 1]);
                        });
                      }))
        ],
      ),
    );
  }

  Widget imageProduct() {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
              Container(
                // width: 100,
                height: MediaQuery.of(context).size.height / 3 + 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.offer
                      ? AssetImage(offer.image)
                      : AssetImage(product.image),
                )),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 20.0)),
                  new Text(
                    widget.offer
                        ? offer.price.toString()
                        : product.price.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Expanded(child: Text("")),
                  new Text(
                    widget.offer ? offer.name : product.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                ],
              ),
              Divider(color: Colors.grey, height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: IconButton(
                    icon: Icon(Icons.remove, color: Color_splash3, size: 20),
                    color: Color_splash3,
                    onPressed: _desCounter,
                  )),
                  Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        '$_counter',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color_splash3,
                        size: 20,
                      ),
                      color: Color_splash3,
                      onPressed: _incrementCounter,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  widget.offer ? offer.description : product.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              )
//          Divider(color: Colors.grey, height: 30),
            ],
          ),
        ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              imageProduct(),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: new Text(
//                  widget.offer ? offer.description : product.description,
//                  style: TextStyle(
//                    fontSize: 16,
//                    color: Colors.black,
//                  ),
//                  textAlign: TextAlign.start,
//                ),
//              )
            ],
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: 120.0,
            child: headerBuild(),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
//          print("myCode");
//          print(myCode);
//          if (myCode == null) {
//            int id = 0;
//            if (orders.isEmpty) {
//              print("orders[i].id");
//              // print(orders[i].id);
//              orderTemp.id = id;
//              orderTemp.isDelivered = false;
//              orderTemp.orderDate = DateTime.now();
//              orderTemp.totalAmount = 2222;
//              orderTemp.no = 100;
//              orderTemp.status = "process";
//              UserProfile usertemp = UserProfile(
//                  id: 1,
//                  city: "dama",
//                  email: "eamil@gmail.com",
//                  firstName: "first name",
//                  lastName: "last name",
//                  phoneNumber: 0909090909,
//                  postCode: 12345);
//              orderTemp.userProfile = usertemp;
//              orders.add(orderTemp);
//            }
//            for (int i = 0; i < orders.length; i++) {
//              if (orders[i].id != id) {
//                print("id=id");
//                orderTemp.id = id;
//                orderTemp.isDelivered = false;
//                orderTemp.orderDate = DateTime.now();
//                orderTemp.totalAmount = 2222;
//                orderTemp.no = 100;
//                orderTemp.status = "process";
//                UserProfile usertemp = UserProfile(
//                    id: 1,
//                    city: "dama",
//                    email: "eamil@gmail.com",
//                    firstName: "first name",
//                    lastName: "last name",
//                    phoneNumber: 0909090909,
//                    postCode: 12345);
//                orderTemp.userProfile = usertemp;
//                orders.add(orderTemp);
//              }
//            }
//
//            orderItem.id = orderItems.length;
//            orderItem.amount = _counter;
//            print(orderItem.amount);
//            orderItem.subTotal = product.price * _counter;
//            orderItem.product = product;
//            orderItem.order = orderTemp;
//            // orderItem.order.orderDate=DateTime.now();
//            // orderItem.order.totalAmount=_counter;
//            // print(orderItems);
//            for (int i = 0; i < orderItems.length; i++) {
//              if (orderItems[i].product.id == orderItem.product.id) {
//                print("length" + orderItems.length.toString());
//                print("orderItems[i].id = " + orderItems[i].id.toString());
//                print("orderItems[i].product.name = " +
//                    orderItems[i].product.name);
//                orderItem.amount=orderItems[i].amount+1;
//                orderItems.removeAt(i);
//              }
//            }
//            orderItems.add(orderItem);
////            return _showSheetMessage(context);
//          } else {
          int id = 0;
          if (orders.isEmpty) {
            print("orders[i].id");
            // print(orders[i].id);
            orderTemp.id = id;
            orderTemp.isDelivered = false;
            orderTemp.orderDate = DateTime.now();
            orderTemp.totalAmount = 2222;
            orderTemp.no = 100;
            orderTemp.status = "process";
            UserProfile usertemp = UserProfile(
                id: 1,
                city: "dama",
                email: "eamil@gmail.com",
                firstName: "first name",
                lastName: "last name",
                phoneNumber: 0909090909,
                postCode: 12345);
            orderTemp.userProfile = usertemp;
            orders.add(orderTemp);
          }
          for (int i = 0; i < orders.length; i++) {
            if (orders[i].id != id) {
              print("id!=id");
              orderTemp.id = id;
              orderTemp.isDelivered = false;
              orderTemp.orderDate = DateTime.now();
              orderTemp.totalAmount = 2222;
              orderTemp.no = 100;
              orderTemp.status = "process";
              UserProfile usertemp = UserProfile(
                  id: 1,
                  city: "dama",
                  email: "eamil@gmail.com",
                  firstName: "first name",
                  lastName: "last name",
                  phoneNumber: 0909090909,
                  postCode: 12345);
              orderTemp.userProfile = usertemp;
              orders.add(orderTemp);
            }
          }

          orderItem.id = orderItems.length;
          orderItem.amount = _counter;
          print(orderItem.amount);
          orderItem.subTotal = product.price * _counter;
          orderItem.product = product;
          orderItem.order = orderTemp;
          // orderItem.order.orderDate=DateTime.now();
          // orderItem.order.totalAmount=_counter;
          // print(orderItems);
          for (int i = 0; i < orderItems.length; i++) {
            if (orderItems[i].product.id == orderItem.product.id) {
              print("length" + orderItems.length.toString());
              print(
                  "amount = " + orderItems[i].amount.toString());
              print(
                  "product.name = " + orderItems[i].product.name);
              orderItem.amount = orderItems[i].amount + 1;
              orderItems.removeAt(i);
            }
          }
          orderItems.add(orderItem);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsScreen(
                        isfav: false,
                        catid: product.category.id,
                      )));
//          }
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
              Text('addtocart',
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

//void _showSheetMessage(context) {
//  showModalBottomSheet(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
//      context: context,
//      builder: (BuildContext bc) {
//        return Container(
//          height: MediaQuery.of(context).size.height / 3,
//          child: ListView(
//            children: <Widget>[
//              AnimationLimiter(
//                  child: Column(
//                      children: AnimationConfiguration.toStaggeredList(
//                duration: const Duration(milliseconds: 375),
//                childAnimationBuilder: (widget) => SlideAnimation(
//                  horizontalOffset: 50.0,
//                  child: FadeInAnimation(
//                    child: widget,
//                  ),
//                ),
//                children: [
//                  Padding(padding: EdgeInsets.only(top: 60)),
//                  Text(
//                    "youshouldloginbeforeaddtocart",
//                    style: TextStyle(
//                        color: Color_splash3,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 18),
//                  ).tr(),
//                  ButtonWidget(
//                    text: "login".tr(),
//                    method: () async {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => LoginScreen()));
//                    },
//                  )
//                ],
//              ))),
//            ],
//          ),
//        );
//      });
//}
