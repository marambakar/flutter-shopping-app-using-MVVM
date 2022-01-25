import 'package:alayniah/screens/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final int catId;
  final String catName;
  final String catImage;

  SingleCategory({this.catId, this.catName, this.catImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: ProductsScreen(
                  isfav: false,
                  catid: catId,
                )));

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ProductsScreen(
        //               isfav: false,
        //               catid: catId,
        //             )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          // border: Border.all(color: Color_splash2),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: AssetImage(catImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            catName,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 1,
//                    ),
//               ),
          ),
        ),
      ),
    );
  }
}
