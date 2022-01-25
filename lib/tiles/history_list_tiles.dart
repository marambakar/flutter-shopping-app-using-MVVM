import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/models/user.dart';
import 'package:alayniah/screens/order/order_details.dart';

import '../config.dart';

class HistoryListTiles extends StatelessWidget {
  final int id;
  final int no;
  final int totalAmount;
  final DateTime orderDate;
  final UserProfile user;
  final bool isDelivered;
  final String status;

  HistoryListTiles({
    this.totalAmount,
    this.id,
    this.status,
    this.isDelivered,
    this.no,
    this.orderDate,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          // print("this is id");
          // print(this.id);
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: OrderDetails(id: this.id,)));

        },
        child: Card(
          shadowColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color_splash3, width: 2)
//            BorderSide(color: Colors.grey, width: 2),
          ),


//          shadowColor: Colors.grey.shade200,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Color_splash2,
                          //   width: 1,
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(

                            fit: BoxFit.cover,
                            image: AssetImage(logo),
                          )),
                    ),
                    SizedBox(width: 16,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#" + no.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color_splash3),
                          maxLines: 1,
                        ),
                        Text(
                          formatDate(orderDate, [
                            yy,
                            '-',
                            M,
                            '-',
                            d,
                          ]).toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          maxLines: 1,
                        ),
                        Text(
                          formatDate(orderDate, [HH, ':', nn, ' ', am])
                              .toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(

                      isDelivered==true?"is Deliverd":"not Delivered",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 1,
                    ),
                    Text(
                      status.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
