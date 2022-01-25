import 'package:alayniah/config.dart';
import 'package:alayniah/screens/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class Single_Sub_Category extends StatelessWidget {
  final int catId;
  final String catName;


  Single_Sub_Category({this.catId, this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

          decoration: BoxDecoration(
            color: Color_splash3.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // border: Border.all(color: Color_splash2),

          ),
          child: Center(
            child: Text(
              catName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200]),
              maxLines: 1,
//                    ),
//               ),
            ),
          ),
        ),
      ),
    );
  }
}
