import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
class SearchResultError extends StatelessWidget {

  SearchResultError({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FaIcon(FontAwesomeIcons.exclamationCircle,color: Colors.black26,size: 125,),
          Text("resultserror".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),),
        ],
      ),
    );
  }
}
