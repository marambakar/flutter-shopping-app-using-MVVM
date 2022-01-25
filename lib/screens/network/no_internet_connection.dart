import 'package:alayniah/config.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {

  VoidCallback voidCallback;

  NoInternetConnection({Key key,@required this.voidCallback}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.wifi,color: Colors.black26,size: 125,),
          Text("withoutconnect",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black26),),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child:  RaisedButton(
              color: Color_splash3,
              textColor: Colors.white,
              onPressed: (){
                voidCallback();
              },
              child: Text("retry"),
            ),
          )

        ],
      ),
    );
  }
}
