import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';

class StadiumBorderElevated extends StatelessWidget {
  const StadiumBorderElevated({
    Key key,
    this.text,
    this.btColor,
    this.textColor = whitish,
    this.press,
    this.style,
  }) : super(key: key);
  final String text;
  final Color btColor;
  final Color textColor;
  final VoidCallback press;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(
        text,
        style: style,
      ),
      style: ElevatedButton.styleFrom(
        textStyle: style,
        primary: btColor,
        onPrimary: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultPadding),
        ),
      ),
    );
  }
}
