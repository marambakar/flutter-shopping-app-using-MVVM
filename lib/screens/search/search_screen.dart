import 'package:alayniah/config.dart';
import 'package:alayniah/models/product.dart';
import 'package:alayniah/network/network_connection.dart';
import 'package:alayniah/network/requests.dart';
import 'package:alayniah/screens/search/no_search_result.dart';
import 'package:alayniah/screens/search/search_result_error.dart';
import 'package:alayniah/screens/search/search_result_placeholder.dart';
import 'package:alayniah/tiles/single_product.dart';
import 'package:alayniah/widget/app_bar_widget.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<Product> _searchBarController =
      SearchBarController();
  bool connectedToNetwork = true;
  bool serverError = false;
  Future<List<Product>> all_products;
  bool isReplay = false;

  Future<List<Product>> _getALlProducts(String text) async {
    await NetworkConnection.isConnected().then((connected) {
      connectedToNetwork = connected;
      serverError = false;
      all_products =
          AppRequests.fetchSearchProducts(text).catchError((error, stackTrace) {
        serverError = true;
      });
    });

    return all_products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        MyAppBar(text:"search".tr() , method: () {
          Navigator.of(context).pop();
        }),

        body: SafeArea(
          child: SearchBar<Product>(
            debounceDuration: Duration(milliseconds: 50),
            searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
            headerPadding: EdgeInsets.symmetric(horizontal: 10),
            searchBarStyle: SearchBarStyle(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              backgroundColor:  Color_splash3.withOpacity(0.2),
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            icon: FaIcon(
              FontAwesomeIcons.search,
            ),
            iconActiveColor: Color_splash3,
            onSearch: _getALlProducts,
            searchBarController: _searchBarController,
            placeHolder: SearchResultPlaceholder(),
            cancellationWidget: Text("searchcancel".tr(),
                style: TextStyle(color: Color_splash3)),
            emptyWidget: NoSearchResult(),
            onError: (error) {
              return SearchResultError();
            },
            onCancelled: () {
              print("Cancelled triggered");
            },
            onItemFound: (Product product, int index) {
              return SingleProduct(
                  proId: product.id,
                  proImage: product.image,
                  proName: product.name);
            },
          ),
        ));
  }
}
