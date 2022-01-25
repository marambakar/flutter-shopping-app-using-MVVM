import 'package:alayniah/data/orders_data.dart';
import 'package:alayniah/screens/order/no_data_screen.dart';
import 'package:alayniah/tiles/history_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alayniah/config.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool serverError = false, connectedToNetwork = true;
  // Future<BookingHistories> model;

  @override
  void initState() {
    super.initState();
    // initialize();
  }

  @override
  Widget build(BuildContext context) {
    print(orders.length);
    return orders.length != 0
        ?
    AnimationLimiter(
      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                    child: HistoryListTiles(
                id: orders[index].id,
                // productName: orderItems[i]
                //     .product
                //     .name, //snapshot.data.categories[index].id,
                totalAmount: orders[index]
                    .totalAmount, //snapshot.data.categories[index].name,
                status: orders[index].status,
                isDelivered: orders[index].isDelivered,
                no: orders[index].no,
                orderDate: orders[index].orderDate,
              )
                ), //snapshot.data.categories[index].image);
              )
//                    ),
          );
//                  );
        },
      ),
    )

//    ListView.builder(
//            itemCount: orders.length,
//            itemBuilder: (BuildContext context, int i) {
//              return HistoryListTiles(
//                id: orders[i].id,
//                // productName: orderItems[i]
//                //     .product
//                //     .name, //snapshot.data.categories[index].id,
//                totalAmount: orders[i]
//                    .totalAmount, //snapshot.data.categories[index].name,
//                status: orders[i].status,
//                isDelivered: orders[i].isDelivered,
//                no: orders[i].no,
//                orderDate: orders[i].orderDate,
//              );
//              //   HistoryListTiles(
//              //   startDate: snapshot
//              //       .data.bookingHistories[i].startDate,
//              //   endDate:
//              //   snapshot.data.bookingHistories[i].endDate,
//              //   status:
//              //   snapshot.data.bookingHistories[i].status,
//              //   total:
//              //   snapshot.data.bookingHistories[i].total,
//              //   paid: snapshot.data.bookingHistories[i].paid,
//              //   payNow:
//              //   snapshot.data.bookingHistories[i].payNow,
//              // );
//            },
//          )
        : NoDataScreen();
  }
}
