import 'package:flutter/material.dart';

class CheckoutRowWidget extends StatelessWidget {
  final String text;
  final double value;
  final int val;

  CheckoutRowWidget({this.val = 0, this.text, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: val == 1 ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          Text(
            (value).toString(),
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: val == 1 ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
