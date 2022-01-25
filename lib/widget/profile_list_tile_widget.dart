import 'package:alayniah/config.dart';
import 'package:flutter/material.dart';

class ProfileListTileWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color iconColor;
  final IconData icon;
//  final bool hasNavigation;
  final Function method;

  const ProfileListTileWidget(
      {Key key,
      this.icon,
      this.text,
      this.color,
      this.iconColor,
//    this.hasNavigation = true,
      this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Color_splash3,
      tileColor: Colors.grey[100],
      onTap: method,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ),
      leading: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: iconColor,
        size: 18,
      ),
    );
  }
}
