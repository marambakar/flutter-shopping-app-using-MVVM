import 'package:flutter/material.dart';
import 'package:alayniah/screens/components/text_field_container.dart';
import 'package:alayniah/config.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon ,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller:controller ,
        onChanged: onChanged,
        cursorColor: Color_splash3,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color_splash3,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
