import 'package:flutter/material.dart';
import 'package:alayniah/tiles/notification_list_tiles.dart';
import 'package:alayniah/models/push_notification.dart';
import 'package:alayniah/data/notifications_data.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:alayniah/screens/notifications/no_notifications_screen.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool noti = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return notifications_list.length != 0
        ? AnimationLimiter(
            child: ListView.builder(
                itemCount: notifications_list.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 300),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: NotificationListTiles(
                          pushnotification: notifications_list[index],
                        )), //snapshot.data.categories[index].image);
                      )
//                    ),
                      );
//                 );
                }))
        : NoNotificationScreen();
  }
}
