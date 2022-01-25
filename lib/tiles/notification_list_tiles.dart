import 'package:flutter/material.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/models/push_notification.dart';
import 'package:readmore/readmore.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationListTiles extends StatefulWidget {
  final PushNotification pushnotification;
  NotificationListTiles({this.pushnotification});
  @override
  _NotificationListTilesState createState() => _NotificationListTilesState();
}

class _NotificationListTilesState extends State<NotificationListTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.pushnotification.setSeen(!widget.pushnotification.seen);
          });
        },
        child: Card(
          shadowColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side:  widget.pushnotification.seen == false? BorderSide(color: Color_splash3, width: 2):
            BorderSide(color: Colors.grey, width: 2),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.notifications_active_rounded,
                        color: widget.pushnotification.seen == false ?Color_splash3:Colors.grey,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pushnotification.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width -160,
                          child:
                          ReadMoreText(widget.pushnotification.body,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 12),
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            colorClickableText: Color_splash3,
                            trimCollapsedText: 'showmore'.tr(),
                            trimExpandedText: 'showless'.tr(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                widget.pushnotification.seen == false
                    ? IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Color_splash3,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.pushnotification.setSeen(true);

                          });
                        })
                    : IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.pushnotification.setSeen(false);

                          });
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
