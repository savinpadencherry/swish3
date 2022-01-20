import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';

class BorderedBoxCard extends StatelessWidget {
  const BorderedBoxCard({
    Key key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);
  final Widget child;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: greish.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(
          defaultPadding / 2,
        ),
      ),
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding / 2,
      ),
      child: child,
    );
  }
}
