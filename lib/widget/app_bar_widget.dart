import 'package:alayniah/config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Function method;
  MyAppBar({this.text, this.method});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color_splash3,
      elevation: 0.0,
      title: Text(
        text.tr(),
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ).tr(),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: method),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
