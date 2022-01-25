import 'package:alayniah/config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function method;
  ButtonWidget({this.text, this.method});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: MaterialButton(
        color: Color_splash3,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        onPressed: method,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ).tr(),
        ),
      ),
    );
  }
}
