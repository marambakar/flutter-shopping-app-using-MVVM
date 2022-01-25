import 'package:alayniah/config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class ServerError extends StatelessWidget {

  VoidCallback voidCallback;

  ServerError({Key key,@required this.voidCallback}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.circle,color: Colors.black26,size: 125,),
          Text("errorconnectwithserver",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),).tr(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child:  RaisedButton(
              color: Color_splash3,
              textColor: Colors.white,
              onPressed: (){
                voidCallback();
              },
              child: Text("retry").tr(),
            ),
          )
        ],
      ),
    );
  }
}
