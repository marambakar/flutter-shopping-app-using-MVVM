//import 'package:alayniah/app_locale.dart';
//import 'package:alayniah/config.dart';
//import 'package:alayniah/screens/account/profile_screen.dart';
//import 'package:alayniah/screens/home_screen.dart';
//import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/material.dart';
//import 'package:easy_localization/easy_localization.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:alayniah/screens/order/history.dart';
//
//import 'notifications/notifications_screen.dart';
//
//class MainScreen extends StatefulWidget {
//  int index;
//  MainScreen({this.index = 0});
//  @override
//  _MainScreenState createState() => _MainScreenState();
//}
//
//class _MainScreenState extends State<MainScreen> {
////  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  bool loggedIn = false;
//  List<Widget> screens = new List<Widget>();
//  TransitionType transitionType = TransitionType.fade;
//  Duration duration = Duration(milliseconds: 100);
//  Curve curve = Curves.ease;
//  int _page = 0;
//  GlobalKey _bottomNavigationKey = GlobalKey();
//
//  @override
//  void initState() {
//    super.initState();
//    setState(() {
//      SharedPreferences.getInstance().then((prefs) {
//        String token = (prefs.getString('token') ?? null);
//        AppLocale().token = token;
//        print(AppLocale().token);
////     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));
//      });
//      loggedIn = AppLocale().token != null;
//    });
////    loggedIn = AppLocale().token != null;
//    print("loooooooooooooooggedIn");
//    print(loggedIn);
//    buildScreens();
//  }
//
//  buildScreens() {
//    screens.add(HomeScreen());
//    screens.add(HistoryScreen());
//    screens.add(NotificationsScreen());
//    screens.add(ProfileScreen());
////    if (loggedIn) {
////      screens.add(AgentsScreen());
////    } else {
////      screens.add(LoginScreen());
////    }
//  }
//
////  List<BottomNavigationBarItem> buildItems() {
////    List<BottomNavigationBarItem> result = new List<BottomNavigationBarItem>();
////    result.add(BottomNavigationBarItem(
////      icon: Icon(
////        Icons.home,
////      ),
////      label: "home".tr(),
////    ));
////    result.add(BottomNavigationBarItem(
////      icon: Icon(
////        Icons.shopping_cart,
////        size: 20,
////      ),
////      label: "myorder".tr(),
////    ));
////    result.add(BottomNavigationBarItem(
////      icon: Icon(
////        Icons.notifications,
////      ),
////      label: "notification".tr(),
////    ));
////    result.add(BottomNavigationBarItem(
////      icon: Icon(
////        Icons.person,
////      ),
////      label: "myprofile".tr(),
////    ));
////    return result;
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////        appBar: AppBar(
////          backgroundColor:Color_splash3,
////          elevation: 0.0,
////          title: Text(
////            "alayniah".tr(),
////            style: TextStyle(color: Colors.white, fontSize: 28),
////          ),
////          centerTitle: true,
////        ),
//        appBar: AppBar(
//          backgroundColor: Color_splash3,
////        elevation: 0.0,
//          title: Image.asset(
//            splash_image3,
//            color: Colors.white,
//            width: 100,
//          ),
//          centerTitle: true,
//        ),
//        body: BottomBarPageTransition(
//          builder: (_, index) => screens[index],
//          currentIndex: widget.index,
//          totalLength: 4,
//          transitionType: transitionType,
//          transitionDuration: duration,
//          transitionCurve: curve,
//        ),
//        bottomNavigationBar: CurvedNavigationBar(
//          key: _bottomNavigationKey,
//          index: 0,
//          height: 50.0,
//          items: <Widget>[
//            Icon(Icons.home, color: Colors.white),
//            Icon(Icons.shopping_cart, color: Colors.white),
//            Icon(Icons.notifications, color: Colors.white),
//            Icon(Icons.person, color: Colors.white),
//          ],
//          color: Color_splash3,
//          buttonBackgroundColor: Color_splash3,
//          backgroundColor: Colors.transparent,
//          animationCurve: Curves.easeInOut,
//          animationDuration: Duration(milliseconds: 600),
//          onTap: (index) {
//            setState(() {
//              widget.index = index;
//            });
//          },
//          letIndexChange: (index) => true,
//        ));
//  }
//
//  Future<void> doPref() async {}
//}

import 'package:alayniah/app_locale.dart';
import 'package:alayniah/config.dart';
import 'package:alayniah/screens/account/profile_screen.dart';
import 'package:alayniah/screens/home_screen.dart';
import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alayniah/screens/order/history.dart';
import 'package:alayniah/tiles/notification_list_tiles.dart';
import 'package:alayniah/data/notifications_data.dart';
import 'package:alayniah/models/push_notification.dart';

import '../main.dart';
import '../models/push_notification.dart';
import 'notifications/notifications_screen.dart';

class MainScreen extends StatefulWidget {
  int index;
  PushNotification pn;
  MainScreen({this.index = 0, this.pn});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool loggedIn = false;
  List<Widget> screens = new List<Widget>();
  TransitionType transitionType = TransitionType.fade;
  Duration duration = Duration(milliseconds: 300);
  Curve curve = Curves.ease;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token;
  @override
  void initState() {
    super.initState();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android?.smallIcon,
              ),
            ));
        print("this is inside");
        if (widget.pn != null) {
          PushNotification pn = PushNotification(
            title: notification.title,
            body: notification.body,
          );
          //PushNotification.fromJson(message.data);
          pn.seen = false;
          setState(() {
            notifications_list.add(pn);
          });
        } else {
          //PushNotification.fromJson(message.data);
          widget.pn.seen = false;
          setState(() {
            notifications_list.add(widget.pn);
          });
        }
      }
    });
    getToken();
//    getTopics();
//    _firebaseMessaging.getToken().then((token) {
//      print('Token: $token');
//    }).catchError((e) {
//      print(e);
//    });
    setState(() {
      SharedPreferences.getInstance().then((prefs) {
        String token = (prefs.getString('token') ?? null);
        AppLocale().token = token;
        print(AppLocale().token);
//     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));
      });
      loggedIn = AppLocale().token != null;
    });
//    loggedIn = AppLocale().token != null;
    print("loooooooooooooooggedIn");
    print(loggedIn);
    buildScreens();
//    registerNotification();
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    print(token);
  }
//  void registerNotification() async {
//    // ...
//
//    // For handling the received notifications
//    _firebaseMessaging.configure(
//      onMessage: (message) async {
//        print('onMessage received: $message');
//
//        // Parse the message received
//        PushNotification notification = PushNotification.fromJson(message);
//        notification.seen = false;
//        setState(() {
//          notifications_list.add(notification);
//        });
//      },
//    );
//  }
////  PushNotification _notificationInfo;

  buildScreens() {
    screens.add(HomeScreen());
    screens.add(HistoryScreen());
    screens.add(NotificationsScreen());
    screens.add(ProfileScreen());
//    if (loggedIn) {
//      screens.add(AgentsScreen());
//    } else {
//      screens.add(LoginScreen());
//    }
  }

//  List<BottomNavigationBarItem> buildItems() {
//    List<BottomNavigationBarItem> result = new List<BottomNavigationBarItem>();
//    result.add(BottomNavigationBarItem(
//      icon: Icon(
//        Icons.home,
//      ),
//      label: "home".tr(),
//    ));
//    result.add(BottomNavigationBarItem(
//      icon: Icon(
//        Icons.shopping_cart,
//        size: 20,
//      ),
//      label: "myorder".tr(),
//    ));
//    result.add(BottomNavigationBarItem(
//      icon: Icon(
//        Icons.notifications,
//      ),
//      label: "notification".tr(),
//    ));
//    result.add(BottomNavigationBarItem(
//      icon: Icon(
//        Icons.person,
//      ),
//      label: "myprofile".tr(),
//    ));
//    return result;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color_splash3,
//        elevation: 0.0,
          title: Image.asset(
            splash_image3,
            color: Colors.white,
            width: 100,
          ),
          centerTitle: true,
        ),
        body:
//        Column(
//
//          children: [
//        Text(
//        'TITLE: ${_notificationInfo.title}',
//          style: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 16.0,
//          )),
            BottomBarPageTransition(
          builder: (_, index) => screens[index],
          currentIndex: widget.index,
          totalLength: 4,
          transitionType: transitionType,
          transitionDuration: duration,
          transitionCurve: curve,
        ),
//          ],
//        ),

        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.notifications, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
          color: Color_splash3,
          buttonBackgroundColor: Color_splash3,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              widget.index = index;
            });
          },
          letIndexChange: (index) => true,
        ));
  }

  Future<void> doPref() async {}
}
