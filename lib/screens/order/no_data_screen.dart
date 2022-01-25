import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
class NoDataScreen extends StatelessWidget {

  NoDataScreen({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//          khalma-empty-cart.png //no-order.svg empty-cart.png
//          empty-cart-icon.png
          Image(image: AssetImage("assets/icons/shopping-cart (1).png"),width: 150,height: 150,),
//          Icon(Icons.do_not_disturb_alt,color: Colors.black26,size: 125,),
          Text("noorder".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),),
        ],
      ),
    );
  }
}
