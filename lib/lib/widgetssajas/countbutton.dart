import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';

class CountButton extends StatelessWidget {
  const CountButton({Key key, this.imgPath, this.color, this.press})
      : super(key: key);

  final String imgPath;
  final Color color;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: defaultPadding * 2,
        width: defaultPadding * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              defaultPadding / 2,
            ),
            color: color),
        child: Image.asset(
          imgPath,
          color: whitish,
        ),
      ),
    );
  }
}
