import 'package:alayniah/config.dart';
import 'package:alayniah/data/order_items_data.dart';
import 'package:alayniah/data/products_data.dart';
import 'package:alayniah/data/sub_category_data.dart';
import 'package:alayniah/models/product.dart';
import 'package:alayniah/models/sub_category.dart';
import 'package:alayniah/screens/cart/cart_screen.dart';
import 'package:alayniah/screens/main_screen.dart';
import 'package:alayniah/tiles/single_product.dart';
import 'package:alayniah/tiles/single_sub_category.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';


class ProductsScreen extends StatefulWidget {
  final bool isfav;
  final int catid;
  ProductsScreen({this.isfav, this.catid});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with TickerProviderStateMixin {
  // var myArrPro = [
  //   {"pro_id": 1, "pro_name": "cat1", "pro_image": "images/cat1.png","pro_price":100},
  //   {"pro_id": 2, "pro_name": "cat2", "pro_image": "images/cat2.png","pro_price":150},
  //   {"pro_id": 3, "pro_name": "cat3", "pro_image": "images/cat3.png","pro_price":100},
  //   {"pro_id": 4, "pro_name": "cat4", "pro_image": "images/pro1.png","pro_price":200},
  //   {"pro_id": 5, "pro_name": "cat5", "pro_image": "images/pro2.png","pro_price":250},
  //   {"pro_id": 6, "pro_name": "cat6", "pro_image": "images/pro3.png","pro_price":300},
  //
  // ];

  TabController _tabControllerCategory;

  bool serverError = false, connectedToNetwork = true;

  bool dataLoaded = false;
  List<Product> listProduct = new List<Product>();
  List<sub_Category> sub_category =new List<sub_Category>();
  @override
  void initState() {
    super.initState();
    if(widget.isfav==false ){
      sub_category =sub_categories_data.where((cat) => cat.categoryId==widget.catid).toList();
      listProduct = products
          .where((product) => product.category.id == widget.catid)
          .toList();
      _tabControllerCategory =new
          TabController(vsync: this, length: sub_category.length+1);
      labelTap=[];
      labelTap.add(0);
      for (var i = 0; i < sub_category.length; i++) {
        labelTap.add(sub_category[i].id);
      }

    }
  }
  List<Tab> tabsCategory = List();

  tabMakerCategory() {
    tabsCategory=[];
    tabsCategory.add(Tab(
        text:
        "all"
    ));
    for (var i = 0; i < sub_category.length; i++) {
      tabsCategory.add(Tab(
          text:
          sub_category[i].name
      ));
    }
    ;
    // print(tabsCategory.length);
    return tabsCategory;
  }
  List<int> labelTap = List();

  @override
  void dispose() {
    _tabControllerCategory.dispose();
    super.dispose();
  }
  Widget getSubCategory(){

    return
      // Container(
      //   // padding: EdgeInsets.symmetric(horizontal:5, vertical: 5),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(5)),
      //   ),
      //   width: MediaQuery.of(context).size.width ,
      //   // height: MediaQuery.of(context).size.height,
      //   child:
        SafeArea(
          child: DefaultTabController(
            length:
            // categories.length,
            sub_category.length!=0?sub_category.length:1,
            // child: Container(
            //   width: MediaQuery.of(context).size.width ,
            //     height: MediaQuery.of(context).size.height,
              child:
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Text(custId.toString()),
                    // Text(_tabControllerCustomer != null
                    //     ? _tabControllerCustomer.index.toString()
                    //     : ""),
                    Container(
                      height: 50,
                      child: ButtonsTabBar(
                          controller: _tabControllerCategory,
                          backgroundColor: Color_splash3,
                          unselectedBackgroundColor: Colors.grey.shade200,
                          unselectedLabelStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          tabs: tabMakerCategory()),
                    ),
                    Container(
                      height:orderItems.length != 0? MediaQuery.of(context).size.height-200:MediaQuery.of(context).size.height-130,
                      child:
                      TabBarView(
                        controller: _tabControllerCategory,
                        children: labelTap.map((int i) {
                          int label = 0;
                          label = i;
                          List<Product> listProductByCat = List();

                          if(label ==0){
                            print("alllllllllllllllllllllll");
                            listProductByCat = products
                                .where((product) => product.category.id == widget.catid)
                                .toList()
                                .length != 0
                                ? products
                                .where((product) => product.category.id == widget.catid)
                                .toList()
                                : List();
                          }else
                          {
                            listProductByCat = products
                                .where((product) => product.sub_Category == label)
                                .toList()
                                .length != 0
                                ? products
                                .where((product) => product.sub_Category == label)
                                .toList()
                                : List();
                          }
                          // print("label:" + label.toString());

                          return GridView.builder(
                              // padding:
                              // EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 0),
                              itemCount: listProductByCat.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 400),
                                  columnCount: 2,
                                  child: ScaleAnimation(
                                    child: FadeInAnimation(
                                        child: SingleProduct(
                                          proId: listProductByCat[index]
                                              .id, //snapshot.data.categories[index].id,
                                          proName: listProductByCat[index]
                                              .name, //snapshot.data.categories[index].name,
                                          proImage: listProductByCat[index].image,
                                          isFav: widget.isfav,
                                          proPrice: listProductByCat[index].price, screen: 3,
                                        )
                                    ),
                                  ),
                                );
                              });
                          //   Center(
                          //   child: Text(
                          //     'This is the $label tab',
                          //     style: const TextStyle(fontSize: 36),
                          //   ),
                          // );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            // ),
          ),
        );
      // );
//      Container(
//      padding: EdgeInsets.symmetric(horizontal: 5),
//      height: 60,
//      child: AnimationLimiter(
//        child: ListView.builder(
//          scrollDirection: Axis.horizontal,
//          itemCount: sub_category.length,
//          itemBuilder: (BuildContext context, int index) {
//            return AnimationConfiguration.staggeredList(
//                position: index,
//                duration: const Duration(milliseconds: 300),
//            child: SlideAnimation(
//            verticalOffset: 50.0,
//                child: ScaleAnimation(
//                  child: FadeInAnimation(
//                      child: Single_Sub_Category(
//                       catId: sub_category[index].id,
//                        catName: sub_category[index].name,
//                      )
//                  ),
//                ),
//              ));
//            },
//          ),
//        ),
//    );

  }


  @override
  Widget build(BuildContext context) {
    return widget.isfav
        ? Scaffold(
        appBar:
        MyAppBar(text: "favorite".tr(),method:  () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: MainScreen(
                    index: 3,
                  )));

        },),


        body: Container(
            child: favProduct.length != 0
                ?
            AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  favProduct.length,
                      (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                            child: SingleProduct(
                              proId: favProduct[index]
                                  .id, //snapshot.data.categories[index].id,
                              proName: favProduct[index]
                                  .name, //snapshot.data.categories[index].name,
                              proImage: favProduct[index].image,
                              isFav: widget.isfav,
                              proPrice: favProduct[index].price, screen: 2,
                            )
                        ),
                      ),
                    );
                  },
                ),
              ),
            )


                :
            Container()
//              NoDataScreen(),
        ))
        : Scaffold(
        appBar: AppBar(
          backgroundColor: Color_splash3,
          title: Text(
            "appname",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ).tr(),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              }),
        ),
        body:
        getSubCategory(),
        bottomNavigationBar: orderItems.length != 0
            ? GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen()));
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
                Icon(Icons.shopping_cart_outlined,
                    color: Colors.white, size: 25.0),
                Expanded(
                  child: Text(""),
                ),
                // GestureDetector(
                //   child:
                Text('viewcart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20))
                    .tr(),
                // ,
                // )
              ],
            ),
          ),
        )
            : Container(child: Text(""),height: 0,)
    );
  }
}
