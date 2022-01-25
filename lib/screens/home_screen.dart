//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/data/categories_data.dart';
import 'package:alayniah/data/offers_data.dart';
import 'package:alayniah/data/products_data.dart';
import 'package:alayniah/models/product.dart';
import 'package:alayniah/network/network_connection.dart';
import 'package:alayniah/screens/network/no_internet_connection.dart';
import 'package:alayniah/screens/network/server_error.dart';
import 'package:alayniah/screens/search/no_search_result.dart';
import 'package:alayniah/screens/search/search_result_error.dart';
import 'package:alayniah/screens/search/search_screen.dart';
import 'package:alayniah/tiles/single_category.dart';
import 'package:alayniah/tiles/single_product.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool serverError = false, connectedToNetwork = true;
//  Future<Categories> model;
  final SearchBarController<Product> _searchBarController =
      SearchBarController();
  Future<List<Product>> _getALlProducts(String text) async {
    List<Product> all_products = [];
    await NetworkConnection.isConnected().then((connected) {
      connectedToNetwork = connected;
      serverError = false;
      text = text.toLowerCase();
      all_products = products
          .where((product) => product.name.toLowerCase().contains(text))
          .toList();
      print("find products :" + all_products.length.toString());
      serverError = true;
    });

    return all_products;
  }

//  @override
//  void initState() {
//    super.initState();
//    initialize();
//  }
//
//  void initialize() {
//    NetworkConnection.isConnected().then((connected) {
//      setState(() {
//        serverError = false;
//        if (connected) {
//          model = AppRequests.fetchCategories().catchError((error, stackTrace) {
//            setState(() {
//              serverError = true;
//            });
//          });
//        }
//        connectedToNetwork = connected;
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // return Builder(
    //     builder: (context) {
    //       if (connectedToNetwork == false) {
    //         return NoInternetConnection(voidCallback: initialize);
    //       } else {
    //         if (serverError) {
    //           return ServerError(voidCallback: initialize);
    //         } else {
    //           return FutureBuilder<HomeScreenModel>(
    //               future: model,
    //               builder: (context, snapshot) {
    //                 if(snapshot.hasData)
    //                 {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: SearchBar<Product>(
          minimumChars: 1,
          debounceDuration: Duration(milliseconds: 50),
          searchBarPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          searchBarStyle: SearchBarStyle(
            backgroundColor: Color_splash3.withAlpha(80),
            padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
          ),
          icon: Icon(Icons.search),
          iconActiveColor: Colors.grey,
          onSearch: _getALlProducts,
          hintText: "searchforproduct".tr(),
          searchBarController: _searchBarController,
          placeHolder: partOfCategory(), //SearchResultPlaceholder(),
          cancellationWidget:
              Text("cancel".tr(), style: TextStyle(color: Colors.grey)),
          emptyWidget: NoSearchResult(),
          onError: (error) {
            return SearchResultError();
          },
          onCancelled: () {
            print("Cancelled triggered");
          },
          onItemFound: (Product product, int index) {
            return Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SingleProduct(
                proId: product.id, //snapshot.data.categories[index].id,
                proName: product.name, //snapshot.data.categories[index].name,
                proImage: product.image,
                proPrice: product.price, screen: 5,
              ),
            );
          },
        ),
      ),
    ));
    //             }
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //       );
    //     }
    //   }
    // })
    // ;
  }

  Widget partOfCategory() {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
//              Row(
//                children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text("category",
                        style: TextStyle(fontSize: 20, color: Color_splash3))
                    .tr(),
              ),
//                ],
//              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 100,
                // color: Color_titleprehome2,
                child: AnimationLimiter(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                                child: SingleCategory(
                                    catId: categories[index]
                                        .id, //snapshot.data.categories[index].id,
                                    catName: categories[index]
                                        .name, //snapshot.data.categories[index].name,
                                    catImage: categories[index]
                                        .image) //snapshot.data.categories[index].image);
                                )),
                      );
//                  );
                    },
                  ),
                ),
//            ListView.builder(
//           scrollDirection: Axis.horizontal,
//                itemCount: categories.length, //snapshot.data.categories.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleCategory(
//                      catId: categories[index]
//                          .id, //snapshot.data.categories[index].id,
//                      catName: categories[index]
//                          .name, //snapshot.data.categories[index].name,
//                      catImage: categories[index]
//                          .image); //snapshot.data.categories[index].image);
//                }),
              ),
              // Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              // Divider(color: Color_splash2,thickness: 5,),
//              Row(
//                children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text("lastproduct",
                        style: TextStyle(fontSize: 20, color: Color_splash3))
                    .tr(),
              ),

//                ],
//              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3 + 20,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: SingleProduct(
                                proId: products[index]
                                    .id, //snapshot.data.categories[index].id,
                                proName: products[index]
                                    .name, //snapshot.data.categories[index].name,
                                proImage: products[index].image,
                                proPrice: products[index].price, screen: 1,
                              )), //snapshot.data.categories[index].image);
                            )
//                    ),
                            );
//                  );
                      },
                    ),
                  )

//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                // padding: EdgeInsets.symmetric(horizontal: 5),
//                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //     crossAxisCount: 1,
//                //     crossAxisSpacing: 10,
//                //     mainAxisSpacing: 0),
//
//                itemCount: products.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleProduct(
//                    proId: products[index]
//                        .id, //snapshot.data.categories[index].id,
//                    proName: products[index]
//                        .name, //snapshot.data.categories[index].name,
//                    proImage: products[index].image,
//                    proPrice: products[index].price, screen: 1,
//                  );
//                }),
                  ),
//              Row(
//                children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text("offers",
                        style: TextStyle(fontSize: 20, color: Color_splash3))
                    .tr(),
              ),

//                ],
//              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: SingleProduct(
                                proId: offers[index]
                                    .id, //snapshot.data.categories[index].id,
                                proName: offers[index]
                                    .name, //snapshot.data.categories[index].name,
                                proImage: offers[index].image,
                                isFav: false,
                                proPrice: offers[index].price, screen: 4,
                              )), //snapshot.data.categories[index].image);
                            )
//                    ),
                            );
//                  );
                      },
                    ),
                  )
//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                // padding: EdgeInsets.symmetric(horizontal: 5),
//                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //     crossAxisCount: 1,
//                //     crossAxisSpacing: 10,
//                //     mainAxisSpacing: 0),
//                itemCount: offers.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleProduct(
//                    proId:
//                        offers[index].id, //snapshot.data.categories[index].id,
//                    proName: offers[index]
//                        .name, //snapshot.data.categories[index].name,
//                    proImage: offers[index].image,
//                    isFav: false,
//                    proPrice: offers[index].price, screen: 4,
//                  );
//                }),
                  ),

//              Row(
//                children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text("bestseller",
                        style: TextStyle(fontSize: 20, color: Color_splash3))
                    .tr(),
              ),

//                ],
//              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: SingleProduct(
                                proId: offers[index]
                                    .id, //snapshot.data.categories[index].id,
                                proName: offers[index]
                                    .name, //snapshot.data.categories[index].name,
                                proImage: offers[index].image,
                                isFav: false,
                                proPrice: offers[index].price,
                                screen: 6,
                              )), //snapshot.data.categories[index].image);
                            )
//                    ),
                            );
//                  );
                      },
                    ),
                  )
//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                // padding: EdgeInsets.symmetric(horizontal: 5),
//                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //     crossAxisCount: 1,
//                //     crossAxisSpacing: 10,
//                //     mainAxisSpacing: 0),
//                itemCount: offers.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleProduct(
//                    proId:
//                        offers[index].id, //snapshot.data.categories[index].id,
//                    proName: offers[index]
//                        .name, //snapshot.data.categories[index].name,
//                    proImage: offers[index].image,
//                    isFav: false,
//                    proPrice: offers[index].price, screen: 4,
//                  );
//                }),
                  ),
//              Row(
//                children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text("mostwatched",
                        style: TextStyle(fontSize: 20, color: Color_splash3))
                    .tr(),
              ),

//                ],
//              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: SingleProduct(
                                proId: offers[index]
                                    .id, //snapshot.data.categories[index].id,
                                proName: offers[index]
                                    .name, //snapshot.data.categories[index].name,
                                proImage: offers[index].image,
                                isFav: false,
                                proPrice: offers[index].price,
                                    screen: 7,
                              )), //snapshot.data.categories[index].image);
                            )
//                    ),
                            );
//                  );
                      },
                    ),
                  )
//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                // padding: EdgeInsets.symmetric(horizontal: 5),
//                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //     crossAxisCount: 1,
//                //     crossAxisSpacing: 10,
//                //     mainAxisSpacing: 0),
//                itemCount: offers.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleProduct(
//                    proId:
//                        offers[index].id, //snapshot.data.categories[index].id,
//                    proName: offers[index]
//                        .name, //snapshot.data.categories[index].name,
//                    proImage: offers[index].image,
//                    isFav: false,
//                    proPrice: offers[index].price, screen: 4,
//                  );
//                }),
                  ),
              Container(
                height: (MediaQuery.of(context).size.height / 2.9) *
                    categories.length,
                child: ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), //                  scrollDirection: Axis.vertical,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Text(categories[index].name,
                                  style: TextStyle(
                                      fontSize: 20, color: Color_splash3))
                              .tr(),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 3.7,
                            child: AnimationLimiter(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: offers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                            child: SingleProduct(
                                          proId: offers[index]
                                              .id, //snapshot.data.categories[index].id,
                                          proName: offers[index]
                                              .name, //snapshot.data.categories[index].name,
                                          proImage: offers[index].image,
                                          isFav: false,
                                          proPrice: offers[index].price,
                                          screen: 4,
                                        )), //snapshot.data.categories[index].image);
                                      )
//                    ),
                                      );
//                  );
                                },
                              ),
                            )
//            ListView.builder(
//                scrollDirection: Axis.horizontal,
//                // padding: EdgeInsets.symmetric(horizontal: 5),
//                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //     crossAxisCount: 1,
//                //     crossAxisSpacing: 10,
//                //     mainAxisSpacing: 0),
//                itemCount: offers.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return SingleProduct(
//                    proId:
//                        offers[index].id, //snapshot.data.categories[index].id,
//                    proName: offers[index]
//                        .name, //snapshot.data.categories[index].name,
//                    proImage: offers[index].image,
//                    isFav: false,
//                    proPrice: offers[index].price, screen: 4,
//                  );
//                }),
                            ), //snapshot.data.categories[index].image);
                      ],
                    );
//                  );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(""),
              )
            ],
          ),
        )));
  }
}
