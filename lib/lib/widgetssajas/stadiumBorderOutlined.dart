import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';

class StadiumBorderOutlined extends StatelessWidget {
  const StadiumBorderOutlined({
    Key key,
    this.text,
    this.textStyle,
    this.press,
    this.borderSideColor = mainYellow,
    this.primaryColor = mainYellow,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  final VoidCallback press;
  final Color borderSideColor;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      child: Text(
        text,
        style: textStyle,
      ),
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        side: BorderSide(
          width: 2.0,
          color: borderSideColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultPadding),
        ),
      ),
    );
  }
}
