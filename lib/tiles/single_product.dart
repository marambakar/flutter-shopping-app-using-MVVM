import 'package:alayniah/app_locale.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/screens/product/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final int proId;
  final String proName;
  final String proImage;
  final double proPrice;
  final bool isFav;
  final int screen;

  SingleProduct(
      {this.proId,
      this.proName,
      this.proImage,
      this.proPrice,
      this.isFav,
      this.screen});

  @override
  Widget build(BuildContext context) {
    //last product
    if (screen == 1) {
      return GestureDetector(
        onTap: () {
          print("details :" + proId.toString());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 1,
                  )));
        },
        child: new Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
//            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Color_splash3,
                            //   width: 1,
                            // ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(proImage),
                            )),
                      ),
//                      AppLocale().locale == Locale('ar')
//                          ? Container(
//                              margin: EdgeInsets.only(top: 15),
//                              padding: EdgeInsets.symmetric(
//                                  horizontal: 30, vertical: 15),
//                              decoration: BoxDecoration(
//                                color: Color_splash3,
//                                border: Border.all(color: Color_splash3),
//                                borderRadius: BorderRadius.only(
//                                    bottomLeft: Radius.circular(20),
//                                    topLeft: Radius.circular(20)),
//                              ),
//                              child: Text(
//                                proName,
//                                style: TextStyle(
//                                    fontSize: 16, color: Colors.white),
//                              ),
//                            )
//                          : Container(
//                              margin: EdgeInsets.only(top: 15),
//                              padding: EdgeInsets.symmetric(
//                                  horizontal: 30, vertical: 15),
//                              decoration: BoxDecoration(
//                                color: Color_splash3,
//                                border: Border.all(color: Color_splash3),
//                                borderRadius: BorderRadius.only(
//                                    bottomRight: Radius.circular(20),
//                                    topRight: Radius.circular(20)),
//                              ),
//                              child: Text(
//                                proName,
//                                style: TextStyle(
//                                    fontSize: 16, color: Colors.white),
//                              ),
//                            )
                    ],
                  ),
                ),
              ],
            )),
      );
    }
    //products by cat
    //fav
    if (screen == 2) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 2,
                  )));
        },
        child: new Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[200],
                                  spreadRadius: 8,
                                  blurRadius: 10,
                                  offset: Offset(3, 3))
                            ],
                            border: Border.all(
                              color: Color_splash3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(proImage),
                            )),
                      ),
                      AppLocale().locale == Locale('ar')
                          ? Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Text(
                                proPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Text(
                                proPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(5),
                //         bottomRight: Radius.circular(5)),
                //     color: Color_splash3,
                //   ),
                //   child: Row(
                //     children: [
                //       new Text(
                //   pro_price.toString(),
                //         style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //       Expanded(child: Text("")),
                //       new Text(
                //         pro_name,
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //     ],
                //   ),
                //
                // ),
              ],
            )),
      );
    }
    //cat
    if (screen == 3) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 3,
                  )));
        },
        child: new Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[200],
                                  spreadRadius: 8,
                                  blurRadius: 10,
                                  offset: Offset(3, 3))
                            ],
                            border: Border.all(
                              color: Color_splash3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(proImage),
                            )),
                      ),
                      AppLocale().locale == Locale('ar')
                          ? Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Text(
                                proPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Text(
                                proPrice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(5),
                //         bottomRight: Radius.circular(5)),
                //     color: Color_splash3,
                //   ),
                //   child: Row(
                //     children: [
                //       new Text(
                //   pro_price.toString(),
                //         style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //       Expanded(child: Text("")),
                //       new Text(
                //         pro_name,
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //     ],
                //   ),
                //
                // ),
              ],
            )),
      );
    }
    //offers
    if (screen == 4) {
      return GestureDetector(
        onTap: () {
          print("details :" + proId.toString());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 1,
                    offer: true,
                  )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3 + 30,
//            margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                // border: Border.all(
                //   color: Color_splash3,
                //   width: 1,
                // ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(proImage),
                )),
          ),
        ),
      );
//      return GestureDetector(
//          onTap: () {
//            print("details :" + proId.toString());
//            Navigator.push(
//                context,
//                PageTransition(
//                    type: PageTransitionType.fade,
//                    child: ProductDetail(
//                      id: this.proId,
//                      screen: 1,
//                      offer: true,
//                    )));
//          },
//          child: Container(
//            child: new Container(
//                width: MediaQuery.of(context).size.width / 3 + 30,
//                margin: EdgeInsets.only(top: 10),
//                padding: EdgeInsets.symmetric(horizontal: 10),
//
////              alignment: Alignment.center,
////              width: MediaQuery.of(context).size.width/2,
////              margin: EdgeInsets.only(top: 10),
////              padding: EdgeInsets.symmetric(horizontal: 10),
//                child: GridTile(
//                  child: proImage.length == 0 || proImage.length == null
//                      ? FadeInImage(
//                    image: AssetImage("images/defaultImage.png"),
//                    fit: BoxFit.cover,
//                    placeholder: AssetImage("images/defaultImage.png"),
//                  )
//                      : FadeInImage(
//                    image: AssetImage(proImage),
//                    fit: BoxFit.cover,
//                    placeholder: AssetImage("images/defaultImage.png"),
//                  ),
//                  footer: Container(
//                    color: Color_splash3,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
////                      AppLocale().locale == Locale('ar')
////                          ?
////                      Text(
////                        nameAr,
////                        style: TextStyle(
////                            fontSize: textSize16, color: Colors.white),
////
////                        textAlign: TextAlign.center,)
////                          :  Text(
////                          nameEn,
//////                            +nameEn+nameEn+nameEn+nameEn+nameEn,
////                          style: TextStyle(
////                              fontSize: 16, color: Colors.white),
////                          textAlign: TextAlign.center
////                      ),
//                        Text(
//                          proPrice.toString(),
//                          style: TextStyle(
//                            fontSize: 16,
//                            color: Colors.white,
//                          ),
//                          textAlign: TextAlign.center,
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//            ),
//          ));
//*************************************************************************
//      return GestureDetector(
//      onTap: () {
//        print("details :" + proId.toString());
//        Navigator.push(
//            context,
//            PageTransition(
//                type: PageTransitionType.fade,
//                child: ProductDetail(
//                  id: this.proId,
//                  screen: 1,
//                  offer: true,
//                )));
//      },
//        child: new Container(
//            width: MediaQuery.of(context).size.width / 3 + 30,
//            margin: EdgeInsets.only(top: 10),
//            padding: EdgeInsets.symmetric(horizontal: 10),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Expanded(
//                  child: Stack(
//                    children: [
//                      Container(
//                        height: double.infinity,
//                        decoration: BoxDecoration(
//                          // border: Border.all(
//                          //   color: Color_splash3,
//                          //   width: 1,
//                          // ),
//                            borderRadius: BorderRadius.all(Radius.circular(5)),
//                            image: DecorationImage(
//                              fit: BoxFit.cover,
//                              image: AssetImage(proImage),
//                            )),
//                      ),
//                      AppLocale().locale == Locale('ar')
//                          ? Container(
//                        margin: EdgeInsets.only(top: 15),
//                        padding: EdgeInsets.symmetric(
//                            horizontal: 30, vertical: 15),
//                        decoration: BoxDecoration(
//                          color: Color_splash3,
//                          border: Border.all(color: Color_splash3),
//                          borderRadius: BorderRadius.only(
//                              bottomLeft: Radius.circular(20),
//                              topLeft: Radius.circular(20)),
//                        ),
//                        child: Text(
//                          proPrice.toString(),
//                          style: TextStyle(
//                              fontSize: 16, color: Colors.white),
//                        ),
//                      )
//                          : Container(
//                        margin: EdgeInsets.only(top: 15),
//                        padding: EdgeInsets.symmetric(
//                            horizontal: 30, vertical: 15),
//                        decoration: BoxDecoration(
//                          color: Color_splash3,
//                          border: Border.all(color: Color_splash3),
//                          borderRadius: BorderRadius.only(
//                              bottomRight: Radius.circular(20),
//                              topRight: Radius.circular(20)),
//                        ),
//                        child: Text(
//                          proPrice.toString(),
//                          style: TextStyle(
//                              fontSize: 16, color: Colors.white),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ],
//            )),
//      );
    }
    //search
    if (screen == 5) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 1,
                  )));
        },
        child: new Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[200],
                                  spreadRadius: 8,
                                  blurRadius: 10,
                                  offset: Offset(3, 3))
                            ],
                            border: Border.all(
                              color: Color_splash3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(proImage),
                            )),
                      ),
                      AppLocale().locale == Locale('ar')
                          ? Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Text(
                                proName.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color_splash3,
                                border: Border.all(color: Color_splash3),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Text(
                                proName.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(5),
                //         bottomRight: Radius.circular(5)),
                //     color: Color_splash3,
                //   ),
                //   child: Row(
                //     children: [
                //       new Text(
                //   pro_price.toString(),
                //         style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //       Expanded(child: Text("")),
                //       new Text(
                //         pro_name,
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //     ],
                //   ),
                //
                // ),
              ],
            )),
      );
    }
    //best seller
    if (screen == 6) {
      return GestureDetector(
        onTap: () {
          print("details :" + proId.toString());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 1,
                    offer: true,
                  )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.all(10),
//              padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridTile(
            child: Container(
//              margin: EdgeInsets.symmetric(horizontal: 10),
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(proImage),
                  )),
            ),
            footer: Container(
              color: Color_splash3.withOpacity(0.5),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//                    AppLocale().locale == Locale('ar')
//                        ?
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      proName,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
//                   : Text(
//                        nameEn,
////                            +nameEn+nameEn+nameEn+nameEn+nameEn,
//                        style: TextStyle(
//                            fontSize: textSize16, color: Colors.white),
//                        textAlign: TextAlign.center
//                    )
                  ,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "100",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white, //Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    //most watched
    if (screen == 7) {
      return GestureDetector(
        onTap: () {
          print("details :" + proId.toString());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: ProductDetail(
                    id: this.proId,
                    screen: 1,offer: true,
                  )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.all(10),
//              padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridTile(
            child: Container(
//              margin: EdgeInsets.symmetric(horizontal: 10),
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(proImage),
                  )),
            ),
            footer: Container(
              color: Colors.white.withOpacity(0.3),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//                    AppLocale().locale == Locale('ar')
//                        ?
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      proName,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
//                   : Text(
//                        nameEn,
////                            +nameEn+nameEn+nameEn+nameEn+nameEn,
//                        style: TextStyle(
//                            fontSize: textSize16, color: Colors.white),
//                        textAlign: TextAlign.center
//                    )
                  ,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "100",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.white, //Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
