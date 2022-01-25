import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class NoNotificationScreen extends StatelessWidget {

  NoNotificationScreen({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/icons/notification (2).png"),width: 150,height: 150,),
//          Icon(Icons.notifications_off,color: Colors.black26,size: 125,),
          Text("nonotifications".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),),
        ],
      ),
    );
  }
}
