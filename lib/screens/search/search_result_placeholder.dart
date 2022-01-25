import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
class SearchResultPlaceholder extends StatelessWidget {

  SearchResultPlaceholder({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search_off,color: Colors.black26,size: 125,),
          Text("noresultyet".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),),
        ],
      ),
    );
  }
}
